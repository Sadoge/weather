import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  static const String _apiKey = '3d04382b74e74274b0e55636231804';
  static const String _baseUrl = 'http://api.weatherapi.com/v1';

  @override
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/current.json?key=$_apiKey&q=$city&aqi=no'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
