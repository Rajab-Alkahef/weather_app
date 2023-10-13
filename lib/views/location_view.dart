// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:waether_app_n/widgets/custom_search_bar.dart';
import 'package:waether_app_n/widgets/location_card.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff144875)])),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weather',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              CustomSearchbar(),
              SizedBox(
                height: 10,
              ),
              LocationCard(),
              SizedBox(
                height: 10,
              ),
              LocationCard(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
