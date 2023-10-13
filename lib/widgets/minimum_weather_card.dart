import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MinimumWeatherCard extends StatelessWidget {
  const MinimumWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xff194f7f),
        border: gradiantBorder(),
      ),
      height: 175,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Now",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            'assets/images/cloudy.png',
            scale: 1.7,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            '18°C',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontFamily: 'Montserrat'),
          )
        ],
      ),
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
