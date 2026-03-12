import 'dart:async';

import 'package:geolocation_example/data_sources/geolocation_data_source.dart';
import 'package:geolocation_example/models/location_bucket.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod/riverpod.dart';

class LocationRepository extends Notifier<LocationBucket> {
  @override
  LocationBucket build() {
    // TODO: implement build
    subscribeToLocationStream();
    return LocationBucket.initial;
  }

  Future<void> updatePosition() async {
    final newCurrent = await ref
        .read(LocationDataSourceProvider)
        .getCurrentPosition();
    print('Position received $newCurrent');
    state = state.copyWith(last: state.current, current: newCurrent);
  }

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  void subscribeToLocationStream() {
    StreamSubscription<Position> positionStream = ref
        .read(LocationDataSourceProvider)
        .getPositionStream(locationSettings)
        .listen((position) {
          print("New Position streamed: $position");
          state = state.copyWith(live: position);
        });
  }
}

final locationRepositoryProvider =
    NotifierProvider<LocationRepository, LocationBucket>(
      LocationRepository.new,
    );
