class Weather {
  late double temp;
  late double elevation;
  late double windspeed;

  // Weather(temp, elevation, windspeed) {
  //   _elevation = elevation;
  //   _temp = temp;
  //   _windspeed = windspeed;
  // }

  //or
  //Weather(this.elevation, this.temp, this.windspeed);
  Weather({
    required this.elevation,
    required this.temp,
    required this.windspeed,
  });

  factory Weather.fromJson(dynamic json) {
    return Weather(
      temp: json["current_weather"]["temperature"],
      elevation: json["elevation"],
      windspeed: json["current_weather"]["windspeed"],
    );
  }

  @override
  String toString() {
    return "Today it is $temp degrees, at $elevation meters, with wind blowing at $windspeed km/h";
  }
}
