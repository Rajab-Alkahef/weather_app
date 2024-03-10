import 'package:flutter/material.dart';
import 'package:waether_app_n/constatnt.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: const Scaffold(
        body: Center(
          child: Text(
            "we will add some setting later..",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "Montserrat"),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
