// lib/src/domain/cubits/cities_cubit/cities_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';
import 'package:weather/src/domain/cubits/cities_cubit/cities_cubit_state.dart';
import 'package:weather/src/domain/services/cities_service/cities_service.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';

class CitiesCubit extends Cubit<CitiesCubitState> {
  final CitiesService citiesService;
  final WeatherService weatherService;

  CitiesCubit({
    required this.citiesService,
    required this.weatherService,
  }) : super(const CitiesCubitState.initial());

  Future<void> getCities() async {
    final cities = await citiesService.getCities();
    final citiesWeather = <WeatherResponse>[];

    for (final city in cities) {
      try {
        final weather = await weatherService.getCurrentWeather(city: city);
        citiesWeather.add(weather);
      } catch (e) {
        emit(CitiesCubitState.error(e.toString()));
      }
    }

    emit(CitiesCubitState.set(citiesWeather));
  }

  Future<void> addCity(String cityName) async {
    emit(const CitiesCubitState.pending());
    try {
      await citiesService.addCity(cityName: cityName);
      await getCities();
    } catch (e) {
      emit(CitiesCubitState.error(e.toString()));
    }
  }

  Future<void> removeCity(String cityName) async {
    emit(const CitiesCubitState.pending());
    try {
      await citiesService.removeCity(cityName: cityName);
      await getCities();
    } catch (e) {
      emit(CitiesCubitState.error(e.toString()));
    }
  }
}
