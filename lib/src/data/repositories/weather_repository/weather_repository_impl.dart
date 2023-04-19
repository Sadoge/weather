import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';

const String baseUrl = 'http://api.weatherapi.com/v1';

class WeatherRepositoryImpl implements WeatherRepository {
  late String? apiKey;

  WeatherRepositoryImpl() {
    apiKey = dotenv.env['WEATHER_API_KEY'];
  }

  @override
  Future<Map<String, dynamic>> fetchCurrentWeather(
      {required String city}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/current.json?key=$apiKey&q=$city&aqi=no'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherForecast(
      {required String city, int days = 7}) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$city&days=$days&aqi=no&alerts=yes'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather forecast data');
    }
  }
}
