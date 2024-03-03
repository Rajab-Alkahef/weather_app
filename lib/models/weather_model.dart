class WeatherModel {
  final String country;
  final String cityName;
  final String date;
  final String? image;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  final String condition;
  final List<dynamic> hourlyForecast;
  final List<dynamic> dayForecast;

  WeatherModel({
    required this.country,
    required this.cityName,
    required this.date,
    required this.image,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    required this.condition,
    required this.hourlyForecast,
    required this.dayForecast,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      country: json['location']['country'],
      cityName: json['location']['name'],
      date: json['forecast']['forecastday'][0]['date'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      hourlyForecast: json['forecast']['forecastday'][0]['hour'],
      dayForecast: json['forecast']['forecastday'],
    );
  }
}
