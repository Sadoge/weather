import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nominatim_geocoding/nominatim_geocoding.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/data/entities/forecast/weather_forecast.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit_state.dart';
import 'package:weather/src/presentation/components/air_condition_widget.dart';
import 'package:weather/src/presentation/components/current_weather_info.dart';
import 'package:weather/src/presentation/components/forecast_day_widget.dart';
import 'package:weather/src/presentation/components/forecast_hour_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherForecastCubit weatherForecastCubit;

//  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
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

      await NominatimGeocoding.init(reqCacheNum: 20);

      Geocoding geocoding = await NominatimGeocoding.to.reverseGeoCoding(
        Coordinate(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );

      // Get the city name from the first placemark
      final cityName = geocoding.address.city.isNotEmpty
          ? geocoding.address.city
          : geocoding.address.state;

      weatherForecastCubit.getWeatherForecast(city: cityName);
    } catch (e) {
      // Handle any errors that may occur
      debugPrint('Error getting location or fetching weather: $e');
    }
  }

  // void _searchCity() {
  //   weatherCubit.getCurrentWeather(city: _cityController.text.trim());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastCubit, WeatherForecastCubitState>(
      bloc: weatherForecastCubit,
      builder: (context, state) => state.maybeWhen(
        set: (data) => SafeArea(
          minimum: const EdgeInsets.fromLTRB(
            Dimensions.regular,
            80,
            Dimensions.regular,
            Dimensions.regular,
          ),
          child: SingleChildScrollView(
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
                CurrentWeatherInfoWidget(data: data),
                const SizedBox(height: Dimensions.regular),
                _buildTodaysForecast(data),
                const SizedBox(height: Dimensions.regular),
                _build7DayForecast(data),
                const SizedBox(height: Dimensions.regular),
                _buildAirConditions(data),
              ],
            ),
          ),
        ),
        error: (message) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.regular),
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
    );
  }

  Widget _buildTodaysForecast(WeatherForecast data) => Container(
        padding: const EdgeInsets.all(Dimensions.regular),
        decoration: BoxDecoration(
          color: WeatherColors.foreground,
          borderRadius: BorderRadius.circular(Dimensions.small),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Today\'s Forecast'.toUpperCase(),
              style: text.copyWith(color: WeatherColors.active),
            ),
            const SizedBox(height: Dimensions.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ForecastHourWidget(
                  forecastHour:
                      data.forecast.forecastDays.first.forecastHours[9],
                ),
                const VerticalDivider(
                  width: 1,
                  color: WeatherColors.foreground,
                ),
                ForecastHourWidget(
                  forecastHour:
                      data.forecast.forecastDays.first.forecastHours[12],
                ),
                const VerticalDivider(
                  width: 1,
                  color: WeatherColors.foreground,
                ),
                ForecastHourWidget(
                  forecastHour:
                      data.forecast.forecastDays.first.forecastHours[15],
                ),
              ],
            ),
          ],
        ),
      );

  Widget _build7DayForecast(WeatherForecast data) => Container(
        padding: const EdgeInsets.all(Dimensions.regular),
        decoration: BoxDecoration(
          color: WeatherColors.foreground,
          borderRadius: BorderRadius.circular(Dimensions.small),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '7-day Forecast'.toUpperCase(),
              style: text.copyWith(color: WeatherColors.active),
            ),
            const SizedBox(height: Dimensions.small),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.forecast.forecastDays.length,
              separatorBuilder: (context, index) => const Divider(
                color: WeatherColors.text,
              ),
              itemBuilder: (context, index) => ForecastDayWidget(
                forecastDay: data.forecast.forecastDays.elementAt(index),
              ),
            ),
          ],
        ),
      );

  Widget _buildAirConditions(WeatherForecast data) => Container(
        padding: const EdgeInsets.all(Dimensions.regular),
        decoration: BoxDecoration(
          color: WeatherColors.foreground,
          borderRadius: BorderRadius.circular(Dimensions.small),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Air conditions'.toUpperCase(),
              style: text.copyWith(color: WeatherColors.active),
            ),
            const SizedBox(height: Dimensions.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AirConditionWidget(
                  title: 'Real Feel',
                  value: '${data.current.feelslikeC}°',
                  iconData: FontAwesomeIcons.temperatureHalf,
                ),
                AirConditionWidget(
                  title: 'Wind',
                  value: '${data.current.windKph} km/h',
                  iconData: FontAwesomeIcons.wind,
                ),
              ],
            ),
            const SizedBox(height: Dimensions.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AirConditionWidget(
                  title: 'Chance of rain',
                  value:
                      '${data.forecast.forecastDays.first.dayInfo.dailyChanceOfRain}%',
                  iconData: FontAwesomeIcons.droplet,
                ),
                AirConditionWidget(
                  title: 'UV Index',
                  value: '${data.current.uv}',
                  iconData: FontAwesomeIcons.sun,
                ),
              ],
            )
          ],
        ),
      );
}
