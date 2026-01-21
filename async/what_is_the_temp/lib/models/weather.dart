class Weather {
  late double _temp;
  late double _elevation;
  late double _windspeed;

  // Weather(temp, elevation, windspeed) {
  //   _elevation = elevation;
  //   _temp = temp;
  //   _windspeed = windspeed;
  // }

  //or
  //Weather(this.elevation, this.temp, this.windspeed);
  // Generative named cosntructor
  Weather({
    required double elevation,
    required double temp,
    required double windspeed,
  }) : _elevation = elevation,
       _temp = temp,
       _windspeed = windspeed;

  factory Weather.fromJson(dynamic json) {
    return Weather(
      temp: json["current_weather"]["temperature"],
      elevation: json["elevation"],
      windspeed: json["current_weather"]["windspeed"],
    );
  }

  double get temp => _temp;
  set temp(double newValue) {
    if (newValue < -50.0) {
      throw Exception("That tempereature is impossible");
    }
    _temp = newValue;
  }

  @override
  String toString() {
    return "Today it is $_temp degrees, at $_elevation meters, with wind blowing at $_windspeed km/h";
  }
}
