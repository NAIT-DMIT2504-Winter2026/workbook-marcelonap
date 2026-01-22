import 'package:what_is_the_temp/services/weather_service.dart'
    as weather_service;
import 'package:what_is_the_temp/models/weather.dart';

void main(List<String> arguments) async {
  Weather todaysWeather = await Weather.fromJson(
    await weather_service.fetchWeather(),
  );
  print(todaysWeather);
}
