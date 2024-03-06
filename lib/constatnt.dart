import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
// import 'package:location/location.dart';

// class LocationService {
//   GeoCode geoCode = GeoCode();
//   Location location = Location();

//   Future<bool> requestPermission() async {
//     final permission = await location.requestPermission();
//     return permission == PermissionStatus.granted;
//   }

//   Future<String> getCurrentLocation() async {
//     final serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       final result = location.requestService;
//       if (result == true) {
//         print('Service has been enabled');
//       } else {
//         throw Exception('GPS service not enabled');
//       }
//     }

//     final locationData = await location.getLocation();
//     log("${locationData.latitude!}");
//     log("${locationData.longitude!}");
//     try {
//       Address address = await geoCode.reverseGeocoding(
//           latitude: locationData.latitude!, longitude: locationData.longitude!);
//       print(address.city);
//       return address.city!;
//     } catch (e) {
//       print(e);
//       return "Error";
//     }
//   }
// }

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<String> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  GeoCode geoCode = GeoCode();
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
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
  print(position);
  try {
    Address address = await geoCode.reverseGeocoding(
        latitude: position.latitude, longitude: position.longitude);
    print(address.city);
    return address.city!;
  } catch (e) {
    print(e);
    return "Error";
  }
  // return await Geolocator.getCurrentPosition();
}

String dateToDayName(String value) {
  return DateFormat.E().format(DateTime.parse(value));
}
