import 'package:flutter/material.dart';
import 'package:waether_app_n/views/home_view.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;

        if (_selectedIndex == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeVieew();
              },
            ),
          );
        } else if (_selectedIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeVieew();
              },
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeVieew();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white.withOpacity(0.5),
          backgroundColor: Colors.white.withOpacity(0.05),
          elevation: 0,
          items: const <BottomNavigationBarItem>[
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
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff2e93ee),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
