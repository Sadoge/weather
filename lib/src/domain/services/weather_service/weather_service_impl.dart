import 'package:weather/src/data/entities/exceptions/weather_service_exception.dart';
import 'package:weather/src/data/entities/forecast/weather_forecast.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';

class WeatherServiceImpl implements WeatherService {
  final WeatherRepository _weatherRepository;

  WeatherServiceImpl(this._weatherRepository);

  @override
  Future<WeatherResponse> getCurrentWeather({required String city}) async {
    try {
      final Map<String, dynamic> weatherData =
          await _weatherRepository.fetchCurrentWeather(city: city);
      return WeatherResponse.fromJson(weatherData);
    } catch (e) {
      // Handle different types of exceptions, if necessary
      throw WeatherServiceException('Error fetching weather data: $e');
    }
  }

  @override
  Future<WeatherForecast> getWeatherForecast({
    required String city,
    int days = 7,
  }) async {
    final response =
        await _weatherRepository.fetchWeatherForecast(city: city, days: days);
    return WeatherForecast.fromJson(response);
  }
}
