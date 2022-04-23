import 'package:bloc_weather_app/features/weather/view/weather_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherView(),
    );
  }
}
