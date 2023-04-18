import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/data/entities/exceptions/weather_service_exception.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit_state.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  final WeatherService _weatherService;

  WeatherCubit(this._weatherService) : super(const WeatherCubitState.initial());

  Future<void> getCurrentWeather({required String city}) async {
    emit(const WeatherCubitState.pending());
    try {
      WeatherResponse weatherResponse =
          await _weatherService.getCurrentWeather(city: city);
      emit(WeatherCubitState.set(weatherResponse));
    } catch (e) {
      if (e is WeatherServiceException) {
        emit(WeatherCubitState.error(e.message));
      } else {
        emit(WeatherCubitState.error('Unknown error: $e'));
      }
    }
  }
}
