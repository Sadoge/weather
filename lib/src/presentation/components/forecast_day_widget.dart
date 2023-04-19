import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/core/weather_codes.dart';
import 'package:weather/src/data/entities/forecast/forecast_day.dart';
import 'package:weather/src/core/date_time_extensions.dart';

class ForecastDayWidget extends StatelessWidget {
  final ForecastDay forecastDay;

  const ForecastDayWidget({required this.forecastDay, super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(forecastDay.date);

    return Row(
      children: [
        SizedBox(
          width: 45,
          child: Text(
            date.isToday ? 'Today' : DateFormat('EEE').format(date),
            style: text,
          ),
        ),
        const SizedBox(width: Dimensions.small),
        FaIcon(
          conditionCodeMapping[forecastDay.dayInfo.condition.code] ??
              FontAwesomeIcons.question,
          color:
              conditionCodeColorMapping[forecastDay.dayInfo.condition.code] ??
                  WeatherColors.text,
          size: 20,
        ),
        const SizedBox(width: Dimensions.small),
        Expanded(
          child: Text(
            forecastDay.dayInfo.condition.text,
            style: text.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          '${forecastDay.dayInfo.maxTempC}',
          style: text.copyWith(
            fontWeight: FontWeight.bold,
            color: WeatherColors.active,
          ),
        ),
        Text(
          '/${forecastDay.dayInfo.minTempC}',
          style: text,
        )
      ],
    );
  }
}
