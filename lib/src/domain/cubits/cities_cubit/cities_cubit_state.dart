import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_cubit_state.freezed.dart';

@freezed
class CitiesCubitState with _$CitiesCubitState {
  const factory CitiesCubitState.initial() = _Initial;
  const factory CitiesCubitState.pending() = _Pending;
  const factory CitiesCubitState.set(List<String> cities) = _Set;
  const factory CitiesCubitState.error(String message) = _Error;
}
