import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app_n/models/weather_model.dart';
import 'package:waether_app_n/services/weather_services.dart';

part 'get_weather_cubit_location_state.dart';

class GetWeatherLocationCubit extends Cubit<WeatherLocationState> {
  GetWeatherLocationCubit() : super(WeatherLocationInitialState());
  late WeatherModel weatherModel;

  getWeatherLocation({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLocationLoadedState());
    } catch (e) {
      emit(WeatherLocationFailureState());
    }
  }
}
