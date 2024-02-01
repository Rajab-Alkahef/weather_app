import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app_n/widgets/custom_bottom_navigation_bar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomButtomNavigationBar(),
      ),
    );
  }
}
