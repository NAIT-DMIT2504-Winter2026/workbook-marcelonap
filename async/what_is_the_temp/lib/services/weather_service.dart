import 'package:http/http.dart' as http;
import 'package:what_is_the_temp/models/weather.dart';
import 'dart:convert';

var url = Uri.parse(
  "https://api.open-meteo.com/v1/forecast?latitude=53.54&longitude=-113.49&current_weather=true",
);

Future<dynamic> fetchWeather() async {
  var response = await http.get(url);

  if (response.statusCode != 200) {
    print("Something went wrong");
    return null;
  }

  var json = jsonDecode(response.body);

  return json;
}
