import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
                children: [
                  HourlyForecastItem(
                    hour: "11:00",
                    hourWeatherIcon: Icons.cloud,
                    hourTemp: "30°C",
                  ),
                  HourlyForecastItem(
                    hour: "11:00",
                    hourWeatherIcon: Icons.cloud,
                    hourTemp: "30°C",
                  ),
                  HourlyForecastItem(
                    hour: "11:00",
                    hourWeatherIcon: Icons.cloud,
                    hourTemp: "30°C",
                  ),
                  HourlyForecastItem(
                    hour: "11:00",
                    hourWeatherIcon: Icons.cloud,
                    hourTemp: "30°C",
                  ),
                  HourlyForecastItem(
                    hour: "11:00",
                    hourWeatherIcon: Icons.cloud,
                    hourTemp: "30°C",
                  ),
                ],
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

class AddtionalInfoItem extends StatelessWidget {
  final IconData infoCardIcon;
  final String infoText;
  final String infoDataValue;

  const AddtionalInfoItem(
      {required this.infoCardIcon,
      required this.infoText,
      this.infoDataValue = "0",
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(
            infoCardIcon,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            infoText,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            infoDataValue,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

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
