import 'package:what_is_the_temp/services/weather_service.dart'
    as weather_service;

void main(List<String> arguments) async {
  print(await weather_service.fetchWeather() ?? "No weather found");
}
