abstract class WeatherRepository {
  Future<Map<String, dynamic>> fetchCurrentWeather({required String city});
}
