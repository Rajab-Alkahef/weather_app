// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app_n/widgets/custom_search_bar.dart';
import 'package:waether_app_n/widgets/location_card.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    // setState(() {});

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff144875)])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weather',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomSearchbar(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitialState) {
                    return const Center(
                        child: Text(
                      "Search for a City",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Montserrat"),
                    ));
                  } else if (state is WeatherLoadedState) {
                    var weatherModel =
                        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
                    String avgTemp = "${weatherModel.avgTemp.toInt()}°";
                    print("avg temp is : $avgTemp");

                    return LocationCard(
                      location: weatherModel.country,
                      cityName: weatherModel.cityName,
                      condition: weatherModel.condition,
                      avgtemp: avgTemp,
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Oops there was an error",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "Montserrat"),
                      ),
                    );
                  }
                },
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // LocationCard(
              //   location: 'Damascus',
              //   cityName: "10",
              // ),
              // SizedBox(
              //   height: 80,
              // ),
            ],
          ),
        ),
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
