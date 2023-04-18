import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';

const String baseUrl = 'http://api.weatherapi.com/v1';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final String? apiKey = dotenv.env['WEATHER_API_KEY'];

    final response = await http.get(
      Uri.parse('$baseUrl/current.json?key=$apiKey&q=$city&aqi=no'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
