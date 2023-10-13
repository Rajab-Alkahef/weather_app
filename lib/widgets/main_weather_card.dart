import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Alexandria",
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '18°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(height: 40, width: 1.5, color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff35648f),
                          borderRadius: BorderRadius.circular(16)),
                      width: 90,
                      height: 45,
                      child: const Center(
                        child: Text(
                          'Cloudy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Positioned(
          top: 125,
          left: 135,
          child: Icon(
            Icons.cloud,
            color: Colors.white,
            size: 125,
          ),
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
