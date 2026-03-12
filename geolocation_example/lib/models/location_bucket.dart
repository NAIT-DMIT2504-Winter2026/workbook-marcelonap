import 'package:geolocator/geolocator.dart';

class LocationBucket {
  const LocationBucket({required this.current, required this.last});
  final Position? last;
  final Position? current;

  LocationBucket copyWith({Position? last, Position? current}) {
    return LocationBucket(
      current: current ?? this.current,
      last: last ?? this.last,
    );
  }
}

class LocationState {
  const LocationState({required this.current, required this.last});
  final Position? last;
  final Position? current;

  LocationState copyWith({Position? last, Position? current}) {
    return LocationState(
      current: current ?? this.current,
      last: last ?? this.last,
    );
  }
}
