import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationBucket {
  const LocationBucket({
    required this.current,
    required this.last,
    required this.live,
  });
  final Position? last;
  final Position? current;
  final Position? live;

  static LocationBucket initial = LocationBucket(
    current: null,
    last: null,
    live: null,
  );
  LocationBucket copyWith({Position? last, Position? current, Position? live}) {
    return LocationBucket(
      current: current ?? this.current,
      last: last ?? this.last,
      live: live ?? this.live,
    );
  }
}

class LocationState {
  const LocationState({
    required this.current,
    required this.last,
    required this.live,
    required this.placemark,
  });
  final Position? last;
  final Position? current;
  final Position? live;
  final Placemark? placemark;

  static LocationState initial = LocationState(
    current: null,
    last: null,
    live: null,
    placemark: null,
  );
  LocationState copyWith({
    Position? last,
    Position? current,
    Position? live,
    Placemark? placemark,
  }) {
    return LocationState(
      current: current ?? this.current,
      last: last ?? this.last,
      live: live ?? this.live,
      placemark: placemark ?? this.placemark,
    );
  }
}
