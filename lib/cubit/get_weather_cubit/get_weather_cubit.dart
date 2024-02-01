import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:waether_app_n/models/weather_model.dart';
import 'package:waether_app_n/services/weather_services.dart';

part 'get_weather_cubit_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
