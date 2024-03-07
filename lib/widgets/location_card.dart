import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key,
      required this.cityName,
      required this.location,
      required this.condition,
      required this.avgtemp});
  final String cityName;
  final String location;
  final String condition;
  final String avgtemp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          border: gradiantBorder(),
          // image: const DecorationImage(
          //   opacity: 0.6,
          //   image: AssetImage(
          //     'assets/images/sky.jpg',
          //   ),
          //   fit: BoxFit.fill,
          //   scale: 1.0,
          // ),
          borderRadius: BorderRadius.circular(9),
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          location,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            cityName,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          condition,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    avgtemp,
                    style: const TextStyle(
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
        width: 1.5);
  }
}
