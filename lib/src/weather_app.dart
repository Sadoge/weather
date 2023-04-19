import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/presentation/dashboard_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: WeatherColors.background,
        scaffoldBackgroundColor: WeatherColors.background,
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );

    if (kIsWeb) {
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/phone_mockup.png',
            fit: BoxFit.cover,
            width: 450,
            height: 936,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 414,
                maxHeight: 896,
              ),
              child: app,
            ),
          ),
        ],
      );
    }

    return app;
  }
}
