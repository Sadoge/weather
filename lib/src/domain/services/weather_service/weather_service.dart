import 'package:weather/src/data/entities/forecast/weather_forecast.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';

abstract class WeatherService {
  Future<WeatherResponse> getCurrentWeather({required String city});
  Future<WeatherForecast> getWeatherForecast(
      {required String city, int days = 7});
}
