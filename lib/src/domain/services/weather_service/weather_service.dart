import 'package:weather/src/data/entities/responses/weather_response.dart';

abstract class WeatherService {
  Future<WeatherResponse> getCurrentWeather({required String city});
}
