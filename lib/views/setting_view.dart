import 'package:flutter/material.dart';
import 'package:waether_app_n/constatnt.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
