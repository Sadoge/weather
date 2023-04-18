import 'package:weather/src/data/entities/exceptions/weather_service_exception.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';

class WeatherServiceImpl implements WeatherService {
  final WeatherRepository _weatherRepository;

  WeatherServiceImpl(this._weatherRepository);

  @override
  Future<WeatherResponse> getCurrentWeather(String city) async {
    try {
      final Map<String, dynamic> weatherData =
          await _weatherRepository.fetchCurrentWeather(city);
      return WeatherResponse.fromJson(weatherData);
    } catch (e) {
      // Handle different types of exceptions, if necessary
      throw WeatherServiceException('Error fetching weather data: $e');
    }
  }
}
