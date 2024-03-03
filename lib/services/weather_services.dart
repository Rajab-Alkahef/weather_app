import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:waether_app_n/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  String apikey = 'a9ff0aa7737d4e15b5480203233009';
  WeatherService(this.dio);
  String baseurl = 'http://api.weatherapi.com/v1';

  //function get response data from api
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$apikey&q=$cityName&days=3');

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
