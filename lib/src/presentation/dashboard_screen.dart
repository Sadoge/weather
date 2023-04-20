import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/presentation/cities/cities_screen.dart';
import 'package:weather/src/presentation/weather/weather_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const WeatherScreen(),
    const CitiesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: WeatherColors.foreground,
        selectedItemColor: WeatherColors.active,
        unselectedItemColor: WeatherColors.text,
        selectedLabelStyle: text,
        unselectedLabelStyle: text,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cloudSun),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.city),
            label: 'Cities',
          ),
        ],
      ),
    );
  }
}
