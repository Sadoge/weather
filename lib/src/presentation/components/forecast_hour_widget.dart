import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/core/weather_codes.dart';
import 'package:weather/src/data/entities/forecast/forecast_hour.dart';

class ForecastHourWidget extends StatelessWidget {
  final ForecastHour forecastHour;

  const ForecastHourWidget({required this.forecastHour, super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            DateFormat('HH:mm').format(DateTime.parse(forecastHour.time)),
            style: text.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Dimensions.small),
          FaIcon(
            conditionCodeMapping[forecastHour.condition.code],
            color: conditionCodeColorMapping[forecastHour.condition.code],
            size: 40,
          ),
          const SizedBox(height: Dimensions.small),
          Text(
            '${forecastHour.tempC}°',
            style: text.copyWith(
              fontSize: 16,
              color: WeatherColors.active,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
