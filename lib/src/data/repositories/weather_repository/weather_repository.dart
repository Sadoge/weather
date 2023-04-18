abstract class WeatherRepository {
  Future<Map<String, dynamic>> fetchCurrentWeather(String city);
}
