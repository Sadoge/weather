// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayInfo _$ForecastDayInfoFromJson(Map<String, dynamic> json) =>
    ForecastDayInfo(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      maxTempF: (json['maxtemp_f'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      minTempF: (json['mintemp_f'] as num).toDouble(),
      avgTempC: (json['avgtemp_c'] as num).toDouble(),
      avgTempF: (json['avgtemp_f'] as num).toDouble(),
      maxWindMph: (json['maxwind_mph'] as num).toDouble(),
      maxWindKph: (json['maxwind_kph'] as num).toDouble(),
      totalPrecipMm: (json['totalprecip_mm'] as num).toDouble(),
      totalPrecipIn: (json['totalprecip_in'] as num).toDouble(),
      totalSnowCm: (json['totalsnow_cm'] as num).toDouble(),
      avgVisKm: (json['avgvis_km'] as num).toDouble(),
      avgVisMiles: (json['avgvis_miles'] as num).toDouble(),
      avgHumidity: (json['avghumidity'] as num).toDouble(),
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
      dailyWillItSnow: json['daily_will_it_snow'] as int,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int,
      uv: (json['uv'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayInfoToJson(ForecastDayInfo instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'avgtemp_c': instance.avgTempC,
      'avgtemp_f': instance.avgTempF,
      'maxwind_mph': instance.maxWindMph,
      'maxwind_kph': instance.maxWindKph,
      'totalprecip_mm': instance.totalPrecipMm,
      'totalprecip_in': instance.totalPrecipIn,
      'totalsnow_cm': instance.totalSnowCm,
      'avgvis_km': instance.avgVisKm,
      'avgvis_miles': instance.avgVisMiles,
      'avghumidity': instance.avgHumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'uv': instance.uv,
      'condition': instance.condition,
    };
