import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherCubit weatherCubit;

  @override
  void initState() {
    super.initState();
    weatherCubit = getIt<WeatherCubit>();
    weatherCubit.getCurrentWeather(city: 'Iloilo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<WeatherCubit, WeatherCubitState>(
              bloc: weatherCubit,
              builder: (context, state) => state.maybeWhen(
                set: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data.location.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${data.current.tempC} °C",
                      style: Theme.of(context).textTheme.titleMedium,
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
                orElse: () => const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
