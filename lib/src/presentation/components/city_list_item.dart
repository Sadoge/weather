import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';
import 'package:weather/src/data/entities/responses/weather_response.dart';

class CityListItem extends StatelessWidget {
  final WeatherResponse weatherResponse;

  const CityListItem({required this.weatherResponse, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Dimensions.regular),
        decoration: BoxDecoration(
          color: WeatherColors.foreground,
          borderRadius: BorderRadius.circular(Dimensions.small),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherResponse.location.name,
                    style: subTitle,
                  ),
                  Text(
                    DateFormat.Hm().format(
                      DateFormat('yyyy-MM-dd HH:mm')
                          .parse(weatherResponse.location.localtime),
                    ),
                    style: text,
                  ),
                ],
              ),
            ),
            Text(
              '${weatherResponse.current.tempC.toInt()}°',
              style: title,
            )
          ],
        ),
      );
}
