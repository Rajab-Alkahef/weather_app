import 'package:flutter/material.dart';
import 'package:waether_app_n/views/location_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LocationView(),
    );
  }
}
