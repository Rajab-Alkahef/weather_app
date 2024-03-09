import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit_location/get_weather_cubit_location.dart';
import 'package:waether_app_n/widgets/weather_view_builder.dart';

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
      child: BlocBuilder<GetWeatherLocationCubit, WeatherLocationState>(
        builder: (context, state) {
          if (state is WeatherLocationInitialState) {
            return const Center(
              child: Text(
                "Loading your location info...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            );
          } else if (state is WeatherLocationLoadedState) {
            var weatherModel =
                BlocProvider.of<GetWeatherLocationCubit>(context).weatherModel;
            return WeatherViewBuilder(
              weatherModel: weatherModel,
            );
          } else {
            return const Center(
              child: Text(
                "Oops there was an Error, please search again",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            );
          }
        },
      ),
    );
  }
}
