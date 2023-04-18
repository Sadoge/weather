import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';

part 'weather_cubit_state.freezed.dart';

@freezed
class WeatherCubitState with _$WeatherCubitState {
  const factory WeatherCubitState.initial() = _Initial;
  const factory WeatherCubitState.pending() = _Pending;
  const factory WeatherCubitState.set(WeatherResponse data) = _Set;
  const factory WeatherCubitState.error(String message) = _Error;
}
