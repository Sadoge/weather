import 'package:flutter/material.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/presentation/dashboard_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: WeatherColors.background,
        scaffoldBackgroundColor: WeatherColors.background,
      ),
      home: const DashboardScreen(),
    );
  }
}
