import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/forecast/forecast.dart';
import 'package:weather/src/data/entities/weather/current.dart';
import 'package:weather/src/data/entities/weather/location.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherForecast({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
