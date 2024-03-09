import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit_location/get_weather_cubit_location.dart';
import 'package:waether_app_n/widgets/custom_bottom_navigation_bar.dart';
import 'package:waether_app_n/widgets/custom_search.dart';
import 'package:waether_app_n/widgets/location_card_gps.dart';
import 'package:waether_app_n/widgets/search_location_view_builder.dart';

class locationViewBuilder extends StatefulWidget {
  const locationViewBuilder({
    super.key,
  });

  @override
  State<locationViewBuilder> createState() => _locationViewBuilderState();
}

class _locationViewBuilderState extends State<locationViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xff0d2843), Color(0xff144875)]),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weather',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomSearch(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherLocationCubit>(context);
                    getWeatherCubit.getWeatherLocation();
                    setState(() {
                      // print(selectedIndex);
                      // selectedIndex = 0;
                      // print(selectedIndex);
                    });
                    // selectedIndex = 0;
                  },
                  child: const LocationGPScard()),
              const SizedBox(height: 10),
              const searchLocationCardBuilder()
            ],
          ),
        ),
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
