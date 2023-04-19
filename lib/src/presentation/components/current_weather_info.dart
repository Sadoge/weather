import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/core/weather_codes.dart';
import 'package:weather/src/data/entities/forecast/weather_forecast.dart';

class CurrentWeatherInfoWidget extends StatelessWidget {
  final WeatherForecast data;

  const CurrentWeatherInfoWidget({required this.data, super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data.location.region.isNotEmpty
                ? data.location.region
                : data.location.name,
            style: title.copyWith(color: WeatherColors.active),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.regular),
          FaIcon(
            conditionCodeMapping[data.current.condition.code] ??
                FontAwesomeIcons.sun,
            color: conditionCodeColorMapping[data.current.condition.code],
            size: 100,
          ),
          const SizedBox(height: Dimensions.regular),
          Text(
            "${data.current.tempC}°",
            style: subTitle.copyWith(color: WeatherColors.active),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
