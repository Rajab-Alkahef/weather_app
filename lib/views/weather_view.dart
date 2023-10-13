import 'package:flutter/material.dart';
import 'package:waether_app_n/widgets/day_forecast_card.dart';
import 'package:waether_app_n/widgets/main_weather_card.dart';
import 'package:waether_app_n/widgets/minimum_weather_card.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff144875)])),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainWeatherCard(),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 24, left: 24),
              child: Text(
                'Today',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MinimumWeatherCard(),
                  MinimumWeatherCard(),
                  MinimumWeatherCard(),
                  MinimumWeatherCard(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    ' 3-Day Forecast',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  DayForecastCard(),
                  SizedBox(
                    height: 12,
                  ),
                  DayForecastCard(),
                  SizedBox(
                    height: 12,
                  ),
                  DayForecastCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
