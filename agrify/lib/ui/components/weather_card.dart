import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class WeatherCard extends StatelessWidget {
  final String weatherFace;
  const WeatherCard({
    super.key,
    required this.weatherFace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimarySwatch.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      child: Center(
        child: Text(
          weatherFace,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
