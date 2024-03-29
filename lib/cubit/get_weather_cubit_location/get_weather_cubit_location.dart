import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:waether_app_n/models/weather_model.dart';
import 'package:waether_app_n/services/weather_services.dart';

part 'get_weather_cubit_location_state.dart';

class GetWeatherLocationCubit extends Cubit<WeatherLocationState> {
  GetWeatherLocationCubit() : super(WeatherLocationInitialState());
  late WeatherModel weatherModel;
  GeoCode geoCode = GeoCode();
  getWeatherLocation() async {
    try {
      // Position positions = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high);
      Position positions = await determinePosition();
      // Future<Address> address = geoCode
      //     .reverseGeocoding(
      //         latitude: positions.latitude, longitude: positions.longitude);
      //     String addr =address.city;
      // String address = await determinePosition();
      // log('message----------------$address----------------------------------');
      weatherModel = await WeatherService(Dio())
          .getCurrentWeatherLocationLatLong(
              latitude: positions.latitude, longitude: positions.longitude);
      emit(WeatherLocationLoadedState());
    } catch (e) {
      emit(WeatherLocationFailureState());
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // print(position);
    try {
      return position;
      // Address address = await geoCode.reverseGeocoding(
      //     latitude: position.latitude, longitude: position.longitude);
      // print(address.city);
      // return address.city!;
    } catch (e) {
      print(e);
      // return "Error";
      throw Exception();
    }
    // return await Geolocator.getCurrentPosition();
  }
}
