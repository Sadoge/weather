import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';

part 'cities_cubit_state.freezed.dart';

@freezed
class CitiesCubitState with _$CitiesCubitState {
  const factory CitiesCubitState.initial() = _Initial;
  const factory CitiesCubitState.pending() = _Pending;
  const factory CitiesCubitState.set(List<WeatherResponse> cities) = _Set;
  const factory CitiesCubitState.error(String message) = _Error;
}
