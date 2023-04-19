import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/forecast/astro.dart';
import 'package:weather/src/data/entities/forecast/forecast_day_info.dart';
import 'package:weather/src/data/entities/forecast/forecast_hour.dart';

part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  final String date;
  @JsonKey(name: 'day')
  final ForecastDayInfo dayInfo;
  final Astro astro;
  @JsonKey(name: 'hour')
  final List<ForecastHour> forecastHours;

  ForecastDay({
    required this.date,
    required this.dayInfo,
    required this.astro,
    required this.forecastHours,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}
