// weather_forecast_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';
import 'weather_forecast_cubit_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastCubitState> {
  final WeatherService _weatherService;

  WeatherForecastCubit(this._weatherService)
      : super(const WeatherForecastCubitState.initial());

  Future<void> getWeatherForecast({required String city, int days = 7}) async {
    emit(const WeatherForecastCubitState.pending());

    try {
      final forecastData =
          await _weatherService.getWeatherForecast(city: city, days: days);
      emit(WeatherForecastCubitState.set(forecastData));
    } catch (e) {
      emit(
        WeatherForecastCubitState.error(
          'Failed to load weather forecast data: ${e.toString()}',
        ),
      );
    }
  }
}
