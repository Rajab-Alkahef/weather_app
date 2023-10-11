import 'package:flutter/material.dart';
import 'package:waether_app_n/widgets/custom_bottom_navigation_bar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomButtomNavigationBar(),
    );
  }
}
