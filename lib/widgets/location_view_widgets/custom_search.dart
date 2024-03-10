import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waether_app_n/constatnt.dart';
import 'package:waether_app_n/widgets/location_view_widgets/custom_search_bar.dart';

import 'package:waether_app_n/cubit/get_weather_cubit/get_weather_cubit.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  // final TextEditingController _textFieldController = TextEditingController();
  String searchValue = '';
  Color color = Colors.white.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField<String>(
      // onFocusChanged: (event) {
      //   FocusScope.of(context).unfocus();
      // },
      // autofocus: true,
      submitOnSuggestionTap: true,
      textChanged: (data) {
        searchValue = data;
      },
      textSubmitted: (data) {
        searchValue = data;
        onSubm(searchValue);
      },
      showCursor: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
      key: key,
      clearOnSubmit: true,
      suggestions: cities,
      // controller: _textFieldController,
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        setState(() {
          searchValue = item;
          onSubm(searchValue);
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        filled: true,
        fillColor: Colors.white.withOpacity(0.07),
        prefixIcon: IconButton(
          padding: const EdgeInsets.only(bottom: 3),
          onPressed: () {
            onSubm(searchValue);
          },
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: color.withOpacity(0.6),
            size: 20,
          ),
        ),
        hintText: "Search for a city",
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white.withOpacity(0.3),
          fontSize: 16,
        ),
        border: gradiantBorder(),
        enabledBorder: gradiantBorder(),
        // labelText: 'Enter city name',
      ),
      itemBuilder: (context, item) {
        return ListTile(
          title: Text(item),
        );
      },
    );
  }

  void onSubm(String value) async {
    // WeatherModel weatherModel =
    //     await WeatherService(Dio()).getCurrentWeather(cityName: value);
    // log(weatherModel.cityName);
    // print(weatherModel.avgTemp);
    var getWeather = BlocProvider.of<GetWeatherCubit>(context);
    getWeather.getWeather(cityName: value);
    print(value);
  }
}
