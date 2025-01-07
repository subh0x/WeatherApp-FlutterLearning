import 'package:flutter/material.dart';

import 'widgets/additional_info_item.dart';
import 'widgets/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  final dynamic hourlyForecasts = [
    {
      "timeOfHour": "11:00",
      "forecastedCondition": "Cloudy",
      "forecastedTemp": 30
    },
    {
      "timeOfHour": "12:00",
      "forecastedCondition": "Sunny",
      "forecastedTemp": 30
    },
    {
      "timeOfHour": "13:00",
      "forecastedCondition": "Sunny",
      "forecastedTemp": 30.5
    },
    {
      "timeOfHour": "14:00",
      "forecastedCondition": "Sunny",
      "forecastedTemp": 31
    },
    {
      "timeOfHour": "15:00",
      "forecastedCondition": "Cloudy",
      "forecastedTemp": 28
    },
    {
      "timeOfHour": "16:00",
      "forecastedCondition": "Cloudy",
      "forecastedTemp": 27
    }
  ];

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.refresh_rounded)),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            // Current Weather Condition Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 225,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "30°C",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.cloud,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rain",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Weather Forecast",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hourlyForecasts
                    .map<Widget>((element) => HourlyForecastItem(
                        hour: element['timeOfHour'],
                        hourWeatherIcon:
                            ((element['forecastedCondition']) == "Sunny")
                                ? Icons.sunny
                                : Icons.cloud,
                        hourTemp: "${element['forecastedTemp']}°C"))
                    .toList(),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Additional Information",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddtionalInfoItem(
                  infoCardIcon: Icons.water_drop,
                  infoText: "Humidity",
                  infoDataValue: "95 %",
                ),
                AddtionalInfoItem(
                  infoCardIcon: Icons.air,
                  infoText: "Wind Speed",
                  infoDataValue: "7.67 Km/hr",
                ),
                AddtionalInfoItem(
                  infoCardIcon: Icons.umbrella,
                  infoText: "Pressure",
                  infoDataValue: "1006 Pa",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
