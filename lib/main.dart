import 'package:flutter/material.dart';

import 'Weather Forecast/weather_forecast.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      home: WeatherForecast(),
    );
  }
}

