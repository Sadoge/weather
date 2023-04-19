import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/forecast/forecast_day.dart';
import 'package:weather/src/data/entities/weather/current.dart';
import 'package:weather/src/data/entities/weather/location.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final Location location;
  final Current current;
  @JsonKey(name: 'forecastday')
  final List<ForecastDay> forecastDays;

  WeatherForecast({
    required this.location,
    required this.current,
    required this.forecastDays,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
