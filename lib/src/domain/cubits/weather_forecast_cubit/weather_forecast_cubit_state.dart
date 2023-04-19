// weather_forecast_cubit_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/src/data/entities/forecast/weather_forecast.dart';

part 'weather_forecast_cubit_state.freezed.dart';

@freezed
class WeatherForecastCubitState with _$WeatherForecastCubitState {
  const factory WeatherForecastCubitState.initial() = _Initial;
  const factory WeatherForecastCubitState.pending() = _Pending;
  const factory WeatherForecastCubitState.set(WeatherForecast data) = _Set;
  const factory WeatherForecastCubitState.error(String message) = _Error;
}
