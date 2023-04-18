import 'package:flutter/material.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:weather/src/weather_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  setupDependencies();

  runApp(const WeatherApp());
}
