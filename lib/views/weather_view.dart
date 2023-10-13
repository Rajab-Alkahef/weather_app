import 'package:flutter/material.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            MainWeatherCard(),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 24, left: 16),
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                  Text(
                    ' 5-Day Forecast',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  DayForecast(),
                  SizedBox(
                    height: 12,
                  ),
                  DayForecast(),
                  SizedBox(
                    height: 12,
                  ),
                  DayForecast(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DayForecast extends StatelessWidget {
  const DayForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Today',
          style: TextStyle(color: Color(0xff768a9a), fontSize: 18),
        ),
        Image.asset(
          'assets/images/clear.png',
          scale: 2,
        ),
        Row(
          children: [
            const Text(
              '18°',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: 5,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const Text(
              '18°',
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        )
      ],
    );
  }
}
