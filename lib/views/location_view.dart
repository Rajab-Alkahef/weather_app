// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app_n/widgets/custom_search.dart';
import 'package:waether_app_n/widgets/custom_search_bar.dart';
import 'package:waether_app_n/widgets/location_card.dart';
import 'package:waether_app_n/widgets/location_card_gps.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    // print(getAddress());
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff144875)])),
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
              const LocationGPScard(),
              const SizedBox(height: 10),
              BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitialState) {
                    return const LocationCard(
                      location: "Search for city..",
                      cityName: "",
                      condition: "",
                      avgtemp: "",
                    );
                  } else if (state is WeatherLoadedState) {
                    var weatherModel =
                        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
                    String avgTemp = "${weatherModel.avgTemp.toInt()}°";

                    return LocationCard(
                      location: weatherModel.country,
                      cityName: weatherModel.cityName,
                      condition: weatherModel.condition,
                      avgtemp: avgTemp,
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
              )
              // SizedBox(
              //   height: 10,
              // ),
              // LocationCard(
              //   location: 'Damascus',
              //   cityName: "10",
              // ),
              // SizedBox(
              //   height: 80,
              // ),
            ],
          ),
        ),
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}

// class LocationGPScard extends StatelessWidget {
//   const LocationGPScard({
//     super.key,
//   });
// Future<String> getAddress() async {
//       LocationService location = LocationService();
//       await location.requestPermission();
//       // String locationData = await location.getCurrentLocation();
//       // Assuming you have some method in LocationService to get address from locationData
//       String address = await location.getCurrentLocation();
//       return address;
//     }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAddress(),
//       builder: BlocBuilder<GetWeatherLocationCubit, WeatherLocationState>(
//         builder: (context, state) {
//           if (state is WeatherLocationInitialState) {
//             return const LocationCard(
//               location: "loading...",
//               cityName: "Loading...",
//               condition: "Loading...",
//               avgtemp: "",
//             );
//           } else if (state is WeatherLocationLoadedState) {
//             var weatherModel =
//                 BlocProvider.of<GetWeatherLocationCubit>(context)
//                     .weatherModel;
//             String avgTemp = "${weatherModel.avgTemp.toInt()}°";

//             return LocationCard(
//               location: weatherModel.country,
//               cityName: weatherModel.cityName,
//               condition: weatherModel.condition,
//               avgtemp: avgTemp,
//             );
//           } else {
//             return const Center(
//               child: Text(
//                 "Oops there was an error",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontFamily: "Montserrat"),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }


