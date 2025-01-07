import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String hour;
  final IconData hourWeatherIcon;
  final String hourTemp;

  const HourlyForecastItem(
      {required this.hour,
      required this.hourWeatherIcon,
      required this.hourTemp,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 125,
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              hour,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            Icon(hourWeatherIcon),
            Text(
              hourTemp,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
