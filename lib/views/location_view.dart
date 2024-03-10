// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:waether_app_n/widgets/location_view_widgets/location_view_builder.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
  // bool isRefreshing = true;

  @override
  Widget build(BuildContext context) {
    // bool isRefreshing = false;
    // print(getAddress());
    return const locationViewBuilder();
  }
}
