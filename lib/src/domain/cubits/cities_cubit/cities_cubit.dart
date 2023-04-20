// lib/src/domain/cubits/cities_cubit/cities_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/domain/cubits/cities_cubit/cities_cubit_state.dart';
import 'package:weather/src/domain/services/cities_service/cities_service.dart';

class CitiesCubit extends Cubit<CitiesCubitState> {
  final CitiesService citiesService;

  CitiesCubit({required this.citiesService})
      : super(const CitiesCubitState.initial());

  Future<void> getCities() async {
    emit(const CitiesCubitState.pending());
    try {
      final cities = await citiesService.getCities();
      emit(CitiesCubitState.set(cities));
    } catch (e) {
      emit(CitiesCubitState.error(e.toString()));
    }
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
