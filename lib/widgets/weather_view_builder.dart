import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waether_app_n/models/weather_model.dart';
import 'package:waether_app_n/widgets/day_forecast_card.dart';
import 'package:waether_app_n/widgets/main_weather_card.dart';
import 'package:waether_app_n/widgets/minimum_weather_card.dart';

class WeatherViewBuilder extends StatefulWidget {
  const WeatherViewBuilder({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;

  @override
  State<WeatherViewBuilder> createState() => _WeatherViewBuilderState();
}

class _WeatherViewBuilderState extends State<WeatherViewBuilder> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredList = timeFilterList();
    // print(dateToDayName(widget.weatherModel.date));
    // log('${widget.weatherModel.dayForecast}');
    // String filter = filteredList[0]['condition']['icon'];
    // print(" ${filteredList[0]['temp_c']}");
    // print(filter);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainWeatherCard(),
          const Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinimumWeatherCard(
                  cardInfo: filteredList[0],
                ),
                MinimumWeatherCard(
                  cardInfo: filteredList[1],
                ),
                MinimumWeatherCard(
                  cardInfo: filteredList[2],
                ),
                MinimumWeatherCard(
                  cardInfo: filteredList[3],
                ),
              ],
            ),
          ),
          const Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                DayForecastCard(
                  dayInfo: widget.weatherModel.dayForecast[0],
                ),
                const SizedBox(
                  height: 12,
                ),
                DayForecastCard(dayInfo: widget.weatherModel.dayForecast[1]),
                const SizedBox(
                  height: 12,
                ),
                DayForecastCard(dayInfo: widget.weatherModel.dayForecast[2]),
              ],
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
    );
  }

  List<dynamic> timeFilterList() {
    List<dynamic> hourList = widget.weatherModel.hourlyForecast;
    List<String> targetTimes = ["00:00", "06:00", "12:00", "18:00"];
    List<dynamic> filteredList = [];
    int i = 0;
    for (var entry in hourList) {
      // print(entry["time"]);
      // print(entry.length);
      String time = entry['time'].split(' ')[1]; // Extracting the time part
      // print(time);
      if (targetTimes.contains(time)) {
        filteredList.add(entry);
      }
      i++;
      if (i == entry.length - 1) {
        break;
      }
    }
    return filteredList;
  }
}

String dateToDayName(String value) {
  return DateFormat.EEEE().format(DateTime.parse(value));
}
