import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/core/colors.dart';
import 'package:weather/src/core/dimensions.dart';
import 'package:weather/src/core/text_styles.dart';

class AirConditionWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;

  const AirConditionWidget({
    required this.title,
    required this.value,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox(
            width: 30,
            child: FaIcon(
              iconData,
              color: WeatherColors.text,
            ),
          ),
          const SizedBox(width: Dimensions.small),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: text,
              ),
              Text(
                value,
                style: text.copyWith(
                  color: WeatherColors.active,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      );
}
