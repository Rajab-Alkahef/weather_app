import 'package:flutter/material.dart';
import 'package:waether_app_n/views/search_view.dart';
import 'package:waether_app_n/widgets/no_weather_body.dart';

class HomeVieew extends StatelessWidget {
  const HomeVieew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: const NoWeatherBody(),
    );
  }
}
