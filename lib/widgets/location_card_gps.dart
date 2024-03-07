import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/constatnt.dart';
import 'package:waether_app_n/cubit/get_weather_cubit_location/get_weather_cubit_location.dart';
import 'package:waether_app_n/widgets/location_card.dart';

class LocationGPScard extends StatelessWidget {
  const LocationGPScard({
    super.key,
  });

  // Future<String> getAddress() async {
  //   LocationService location = LocationService();
  //   await location.requestPermission();
  //   // String locationData = await location.getCurrentLocation();
  //   // Assuming you have some method in LocationService to get address from locationData
  //   String address = await location.getCurrentLocation();
  //   return address;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: determinePosition(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while fetching address
          return const LocationCard(
            location: "loading...",
            cityName: "Loading...",
            condition: "Loading...",
            avgtemp: "",
          );
        } else if (snapshot.hasError) {
          // Handle error if occurred while fetching address
          return Text('Error: ${snapshot.error}');
        } else {
          // Address fetched successfully, now you can get weather
          var getWeather = BlocProvider.of<GetWeatherLocationCubit>(context);
          log(snapshot.data!);
          getWeather.getWeatherLocation(cityName: snapshot.data!);
          // Return a placeholder widget or null, as this is the build method
          return BlocBuilder<GetWeatherLocationCubit, WeatherLocationState>(
            builder: (context, state) {
              if (state is WeatherLocationInitialState) {
                return const LocationCard(
                  location: "loading...",
                  cityName: "Loading...",
                  condition: "Loading...",
                  avgtemp: "",
                );
              }
              if (state is WeatherLocationLoadedState) {
                var weatherModel =
                    BlocProvider.of<GetWeatherLocationCubit>(context)
                        .weatherModel;
                String avgTemp = "${weatherModel.avgTemp.toInt()}°";

                return LocationCard(
                  location: weatherModel.country,
                  cityName: weatherModel.cityName,
                  condition: weatherModel.condition,
                  avgtemp: avgTemp,
                );
              } else {
                return const Stack(
                  alignment: Alignment.center,
                  children: [
                    LocationCard(
                      location: "",
                      cityName: "",
                      condition: "",
                      avgtemp: "",
                    ),
                    Center(
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
      },
    );
  }
}
