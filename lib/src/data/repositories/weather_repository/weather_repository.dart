abstract class WeatherRepository {
  Future<Map<String, dynamic>> fetchCurrentWeather({required String city});
  Future<Map<String, dynamic>> fetchWeatherForecast(
      {required String city, int days = 7});
}
