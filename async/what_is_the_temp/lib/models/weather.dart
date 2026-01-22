class Weather {
  late double _temp;
  late double _elevation;
  late double _windspeed;

  // Generative named cosntructor
  Weather({
    required double elevation,
    required double temp,
    required double windspeed,
  }) {
    this.elevation = elevation;
    this.temp = temp;
    this.windspeed = windspeed;
  }

  factory Weather.fromJson(dynamic json) {
    return Weather(
      temp: json["current_weather"]["temperature"],
      elevation: json["elevation"],
      windspeed: json["current_weather"]["windspeed"],
    );
  }

  double get temp => _temp;
  set temp(double newValue) {
    _temp = newValue;
  }

  double get elevation => _elevation;
  set elevation(double newValue) {
    _elevation = newValue;
  }

  double get windspeed => _windspeed;
  set windspeed(double newValue) {
    if (newValue < 0.0) {
      throw Exception("That windspeed is impossible");
    }
    _windspeed = newValue;
  }

  @override
  String toString() {
    return "Today it is $_temp degrees, at $_elevation meters, with wind blowing at $_windspeed km/h";
  }
}
