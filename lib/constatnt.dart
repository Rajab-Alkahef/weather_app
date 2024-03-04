import 'dart:developer';

import 'package:geocode/geocode.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class LocationService {
  GeoCode geoCode = GeoCode();
  Location location = Location();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<String> getCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final result = location.requestService;
      if (result == true) {
        print('Service has been enabled');
      } else {
        throw Exception('GPS service not enabled');
      }
    }

    final locationData = await location.getLocation();
    log("${locationData.latitude!}");
    log("${locationData.longitude!}");
    try {
      Address address = await geoCode.reverseGeocoding(
          latitude: locationData.latitude!, longitude: locationData.longitude!);
      print(address.city);
      return address.city!;
    } catch (e) {
      print(e);
      return "Error";
    }
  }
}

String dateToDayName(String value) {
  return DateFormat.E().format(DateTime.parse(value));
}
