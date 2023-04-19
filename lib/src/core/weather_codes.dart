import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Map<int, IconData> conditionCodeMapping = {
  1000: FontAwesomeIcons.sun,
  1003: FontAwesomeIcons.cloudSun,
  1063: FontAwesomeIcons.cloudSunRain,
};
Map<int, Color> conditionCodeColorMapping = {
  1000: const Color(0xFFFCB249),
  1003: const Color(0xFFC3D8FA),
  1063: const Color(0xFF8CB8FF),
};
