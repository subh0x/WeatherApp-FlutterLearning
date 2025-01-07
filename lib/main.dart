import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'weather_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(textTheme: GoogleFonts.outfitTextTheme()),
      home: WeatherScreen(),
    );
  }
}
