import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff0d2843), Color(0xff144875)])),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        /* appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('weather'),
        ),
     */
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}
