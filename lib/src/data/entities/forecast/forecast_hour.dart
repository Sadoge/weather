import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/weather/condition.dart';

part 'forecast_hour.g.dart';

@JsonSerializable()
class ForecastHour {
  @JsonKey(name: 'time_epoch')
  final int timeEpoch;
  @JsonKey(name: 'time')
  final String time;
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  @JsonKey(name: 'is_day')
  final int isDay;
  final Condition condition;
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @JsonKey(name: 'wind_degree')
  final int windDegree;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  @JsonKey(name: 'precip_in')
  final double precipIn;
  @JsonKey(name: 'humidity')
  final int humidity;
  @JsonKey(name: 'cloud')
  final int cloud;
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double windchillC;
  @JsonKey(name: 'windchill_f')
  final double windchillF;
  @JsonKey(name: 'heatindex_c')
  final double heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double dewpointF;
  @JsonKey(name: 'will_it_rain')
  final int willItRain;
  @JsonKey(name: 'chance_of_rain')
  final int chanceOfRain;
  @JsonKey(name: 'will_it_snow')
  final int willItSnow;
  @JsonKey(name: 'chance_of_snow')
  final int chanceOfSnow;
  @JsonKey(name: 'vis_km')
  final double visKm;
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  @JsonKey(name: 'gust_mph')
  final double gustMph;
  @JsonKey(name: 'gust_kph')
  final double gustKph;
  @JsonKey(name: 'uv')
  final double uv;

  ForecastHour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.condition,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastHourToJson(this);
}
