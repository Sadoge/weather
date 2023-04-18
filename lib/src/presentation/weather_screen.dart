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
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weatherCubit = getIt<WeatherCubit>();
    weatherCubit.getCurrentWeather(city: 'Iloilo');
  }

  void _searchCity() {
    weatherCubit.getCurrentWeather(city: _cityController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _searchCity,
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter city',
                hintText: 'e.g. Iloilo',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _searchCity(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherCubitState>(
                bloc: weatherCubit,
                builder: (context, state) => state.maybeWhen(
                  set: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data.location.region.isNotEmpty ? data.location.region : data.location.name}, ${data.location.country}",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${data.current.tempC} °C",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.current.condition.text,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
