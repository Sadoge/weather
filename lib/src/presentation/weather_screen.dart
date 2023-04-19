import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/core/weather_codes.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherCubit weatherCubit;
  late WeatherForecastCubit weatherForecastCubit;

  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weatherCubit = getIt<WeatherCubit>();
    weatherForecastCubit = getIt<WeatherForecastCubit>();

    _getLocationAndFetchWeather();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getLocationAndFetchWeather() async {
    try {
      final position = await _determinePosition();

      // Convert the coordinates to a city name
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Get the city name from the first placemark
      final cityName = placemarks.first.locality;

      // Fetch the weather for the city
      if (cityName != null) {
        // weatherCubit.getCurrentWeather(city: cityName);
        weatherForecastCubit.getWeatherForecast(city: cityName);
      }
    } catch (e) {
      // Handle any errors that may occur
      debugPrint('Error getting location or fetching weather: $e');
    }
  }

  void _searchCity() {
    weatherCubit.getCurrentWeather(city: _cityController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(20, 100, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TextField(
          //   controller: _cityController,
          //   decoration: const InputDecoration(
          //     labelText: 'Enter city',
          //     hintText: 'e.g. Iloilo',
          //     border: OutlineInputBorder(),
          //   ),
          //   onSubmitted: (_) => _searchCity(),
          // ),
          // const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<WeatherForecastCubit, WeatherForecastCubitState>(
              bloc: weatherForecastCubit,
              builder: (context, state) => state.maybeWhen(
                set: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.location.region.isNotEmpty
                          ? data.location.region
                          : data.location.name,
                      style: title.copyWith(color: WeatherColors.active),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    FaIcon(
                      conditionCodeMapping[data.current.condition.code] ??
                          FontAwesomeIcons.sun,
                      color: WeatherColors.text,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${data.current.tempC}°",
                      style: subTitle.copyWith(color: WeatherColors.active),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                error: (message) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                orElse: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
