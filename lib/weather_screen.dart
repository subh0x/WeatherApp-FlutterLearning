import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'widgets/hourly_forecast_item.dart';
import 'widgets/additional_info_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late dynamic apiResponse;
  late dynamic locationWeatherData;
  final String cityName = "Chennai";
  double currentTemp = 0;
  double currentTempFeelsLike = 0;
  final openWeatherAPIKey = dotenv.env['OPENWEATHER_API_KEY'];
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

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&exclude=minutely,daily,alerts&appid=$openWeatherAPIKey');
    apiResponse = await http.get(url);
    setState(() {
      locationWeatherData = json.decode(apiResponse.body.toString());
    });

    setState(() {
      currentTemp = locationWeatherData["main"]["temp"];
      currentTempFeelsLike = locationWeatherData["main"]["feels_like"];
    });
    if (kDebugMode) {
      print(apiResponse.body);
    }
  }

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
                onPressed: getCurrentWeather,
                icon: const Icon(Icons.refresh_rounded)),
          ),
        ],
        centerTitle: true,
      ),
      body: (currentTemp == 0)
          ? Center(child: const CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cityName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Icon(Icons.location_on_outlined),
                    ],
                  ),
                  // Current Weather Condition Card
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: 240,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "${currentTemp.toString()}°C",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Text(
                            "Feels like ${currentTempFeelsLike.toString()}°C",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
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
                            locationWeatherData["weather"].toList()[0]["main"],
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
                        infoDataValue:
                            locationWeatherData["main"]["humidity"].toString(),
                      ),
                      AddtionalInfoItem(
                        infoCardIcon: Icons.air,
                        infoText: "Wind Speed",
                        infoDataValue:
                            "${locationWeatherData["wind"]["speed"].toString()} m/s",
                      ),
                      AddtionalInfoItem(
                        infoCardIcon: Icons.scale_rounded,
                        infoText: "Pressure",
                        infoDataValue:
                            "${locationWeatherData["main"]["pressure"].toString()} hPa",
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
