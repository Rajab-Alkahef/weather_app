import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    String avgTemp = "${weatherModel.avgTemp.toInt()}°";
    List<String> condition = weatherModel.condition.split(" ");
    String conditionmodified = " ";
    if (condition.length >= 2) {
      conditionmodified = "${condition[0]} ${condition[1]}";
    } else {
      conditionmodified = condition[0];
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: const Alignment(0, -0.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: const Color(0xff194f7f),
              border: gradiantBorder(),
            ),
            height: 200,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 30, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      avgTemp,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(height: 40, width: 1.5, color: Colors.white),
                    const SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        conditionmodified,
                        style: TextStyle(
                            background: Paint()
                              ..strokeWidth = 30.0
                              ..color = Colors.grey.withOpacity(0.3)
                              ..style = PaintingStyle.stroke
                              ..strokeJoin = StrokeJoin.round,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Montserrat'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 145,
          left: 135,
          child: Image.network(
            "https:${weatherModel.image}",
            scale: 0.55,
          ),
          // child: Icon(
          //   Icons.cloud,
          //   color: Colors.white,
          //   size: 125,
          // ),
        ),
      ],
    );
  }

  GradientBoxBorder gradiantBorder() {
    return const GradientBoxBorder(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromARGB(255, 38, 114, 190),
          Color.fromARGB(255, 45, 148, 239),
        ],
      ),
      width: 1.5,
    );
  }
}
