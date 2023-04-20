import 'package:flutter/material.dart';
import 'package:weather/src/core/dependency_injection.dart';
import 'package:weather/src/weather_app.dart';

void main() async {
  setupDependencies();

  runApp(const WeatherApp());
}
