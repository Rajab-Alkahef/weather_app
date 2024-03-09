import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'package:waether_app_n/constatnt.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key,
      required this.cityName,
      required this.location,
      required this.condition,
      required this.avgtemp,
      this.refresh = ''});
  final String refresh;
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
          border: gradiantBorders(),
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
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          refresh,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
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
}
