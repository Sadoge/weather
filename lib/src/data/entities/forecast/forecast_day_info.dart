import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/weather/condition.dart';

part 'forecast_day_info.g.dart';

@JsonSerializable()
class ForecastDayInfo {
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;

  @JsonKey(name: 'maxtemp_f')
  final double maxTempF;

  @JsonKey(name: 'mintemp_c')
  final double minTempC;

  @JsonKey(name: 'mintemp_f')
  final double minTempF;

  @JsonKey(name: 'avgtemp_c')
  final double avgTempC;

  @JsonKey(name: 'avgtemp_f')
  final double avgTempF;

  @JsonKey(name: 'maxwind_mph')
  final double maxWindMph;

  @JsonKey(name: 'maxwind_kph')
  final double maxWindKph;

  @JsonKey(name: 'totalprecip_mm')
  final double totalPrecipMm;

  @JsonKey(name: 'totalprecip_in')
  final double totalPrecipIn;

  @JsonKey(name: 'totalsnow_cm')
  final double totalSnowCm;

  @JsonKey(name: 'avgvis_km')
  final double avgVisKm;

  @JsonKey(name: 'avgvis_miles')
  final double avgVisMiles;

  @JsonKey(name: 'avghumidity')
  final double avgHumidity;

  @JsonKey(name: 'daily_will_it_rain')
  final int dailyWillItRain;

  @JsonKey(name: 'daily_chance_of_rain')
  final int dailyChanceOfRain;

  @JsonKey(name: 'daily_will_it_snow')
  final int dailyWillItSnow;

  @JsonKey(name: 'daily_chance_of_snow')
  final int dailyChanceOfSnow;

  @JsonKey(name: 'uv')
  final double uv;

  final Condition condition;

  ForecastDayInfo({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.totalSnowCm,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.uv,
    required this.condition,
  });

  factory ForecastDayInfo.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayInfoToJson(this);
}
