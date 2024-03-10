import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit_location/get_weather_cubit_location.dart';
import 'package:waether_app_n/widgets/location_card.dart';

class LocationGPScard extends StatelessWidget {
  const LocationGPScard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Address fetched successfully, now you can get weather

        // Return a placeholder widget or null, as this is the build method
        BlocBuilder<GetWeatherLocationCubit, WeatherLocationState>(
      builder: (context, state) {
        if (state is WeatherLocationInitialState) {
          return const LocationCard(
            location: "loading...",
            cityName: "Loading...",
            condition: "",
            avgtemp: "",
          );
        }
        if (state is WeatherLocationLoadedState) {
          log("Got data");
          var weatherModel =
              BlocProvider.of<GetWeatherLocationCubit>(context).weatherModel;
          String avgTemp = "${weatherModel.avgTemp.toInt()}°";

          return LocationCard(
            location: weatherModel.country,
            cityName: weatherModel.cityName,
            condition: weatherModel.condition,
            avgtemp: avgTemp,
            refresh: 'Tap to refresh',
          );
        } else {
          return Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherLocationCubit>(context);
                  getWeatherCubit.getWeatherLocation();
                  // setState(() {
                  // print(selectedIndex);
                  // selectedIndex = 0;
                  // print(selectedIndex);
                  // });
                  // selectedIndex = 0;
                },
                child: const LocationCard(
                  location: "",
                  cityName: "",
                  condition: "",
                  avgtemp: "",
                  refresh: '',
                ),
              ),
              const Center(
                child: Text(
                  'oops there was an error please try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(1.5, 1.5),
                          blurRadius: 5)
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
