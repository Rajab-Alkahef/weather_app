import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';
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
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Center(
              child: Text(
                "Search for a City in Location Page",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            );
          } else if (state is WeatherLoadedState) {
            var weatherModel =
                BlocProvider.of<GetWeatherCubit>(context).weatherModel;
            return WeatherViewBuilder(
              weatherModel: weatherModel,
            );
          } else {
            return const Center(
              child: Text(
                "Oops there was an Error, please try again",
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
