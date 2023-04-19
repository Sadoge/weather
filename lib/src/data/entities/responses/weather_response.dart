import 'package:json_annotation/json_annotation.dart';
import 'package:weather/src/data/entities/weather/current.dart';
import 'package:weather/src/data/entities/weather/location.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final Location location;
  final Current current;

  WeatherResponse({required this.location, required this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
