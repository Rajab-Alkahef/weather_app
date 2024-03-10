import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/cubit/get_weather_cubit_location/get_weather_cubit_location.dart';
import 'package:waether_app_n/views/location_view.dart';
import 'package:waether_app_n/views/setting_view.dart';
import 'package:waether_app_n/views/weather_view.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({
    super.key,
  });
  // final int _selectedIndex = 1;
  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  final List<Widget> tabs = [
    const WeatherView(),
    const LocationView(),
    const SettingView(),
  ];
  @override
  void initState() {
    var getWeatherCubit = BlocProvider.of<GetWeatherLocationCubit>(context);
    getWeatherCubit.getWeatherLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        tabs.elementAt(_selectedIndex),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: const Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.white.withOpacity(0.5),
                backgroundColor: Colors.white.withOpacity(0.05),
                elevation: 0,
                currentIndex: _selectedIndex,
                selectedItemColor: const Color(0xff2e93ee),
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.cloud_queue_rounded),
                    label: 'Weather',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Location',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
