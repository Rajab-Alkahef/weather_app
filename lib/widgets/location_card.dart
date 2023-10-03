import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          border: GradiantBorder(),
          // image: const DecorationImage(
          //   opacity: 0.6,
          //   image: AssetImage(
          //     'assets/images/sky.jpg',
          //   ),
          //   fit: BoxFit.fill,
          //   scale: 1.0,
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/sky.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
            ).blurred(
              alignment: Alignment.centerRight,
              borderRadius: BorderRadius.circular(8),
              blur: 2,
              blurColor: Colors.black,
              colorOpacity: 0.4,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My location ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Alexandria ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Mostly Cloudy ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '18°',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GradientBoxBorder GradiantBorder() {
    return const GradientBoxBorder(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 38, 114, 190),
            Color.fromARGB(255, 45, 148, 239),
          ],
        ),
        width: 2);
  }
}
