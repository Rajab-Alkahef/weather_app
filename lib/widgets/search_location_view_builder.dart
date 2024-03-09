import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app_n/widgets/location_card.dart';
import 'package:waether_app_n/widgets/weather_view_builder.dart';

class searchLocationCardBuilder extends StatefulWidget {
  const searchLocationCardBuilder({
    super.key,
  });

  @override
  State<searchLocationCardBuilder> createState() =>
      _searchLocationCardBuilderState();
}

class _searchLocationCardBuilderState extends State<searchLocationCardBuilder>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0, // SnackBar starts fully transparent
      end: 1.0, // SnackBar ends fully opaque
    ).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return GestureDetector(
            onTap: () {
              customizedsnackbar(context);
            },
            child: const LocationCard(
              location: "Search for city..",
              cityName: "",
              condition: "",
              avgtemp: "",
            ),
          );
        } else if (state is WeatherLoadedState) {
          var weatherModel =
              BlocProvider.of<GetWeatherCubit>(context).weatherModel;
          String avgTemp = "${weatherModel.avgTemp.toInt()}°";

          return GestureDetector(
            onTap: () {
              print('pressed');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xff0d2843), Color(0xff144875)]),
                      ),
                      child: WeatherViewBuilder(
                        weatherModel: weatherModel,
                      ),
                    );
                  },
                ),
              );
            },
            child: LocationCard(
              location: weatherModel.country,
              cityName: weatherModel.cityName,
              condition: weatherModel.condition,
              avgtemp: avgTemp,
            ),
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
                  'oops there was an error, please search again',
                  // maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(1.5, 1.5),
                        blurRadius: 5)
                  ]),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  void customizedsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        animation: _fadeAnimation,
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 2),
        content: const Text(
          'Search for a city first',
          style: TextStyle(color: Color(0xff2d8fe8)),
        ),
        action: SnackBarAction(
            label: 'ok',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
