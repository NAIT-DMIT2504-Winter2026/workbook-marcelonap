import 'package:geolocation_example/models/location_bucket.dart';
import 'package:geolocation_example/repositories/geolocation_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:geocoding/geocoding.dart';

class LocationViewModel extends Notifier<LocationState> {
  @override
  LocationState build() {
    subscribeToLocationUpdates();
    // TODO: implement build
    return LocationState.initial;
  }

  void subscribeToLocationUpdates() {
    ref.listen(
      locationRepositoryProvider.select(
        (locationBucket) => locationBucket.current,
      ),
      (oldCurrent, newCurrent) async {
        state = state.copyWith(last: oldCurrent, current: newCurrent);
      },
    );
    ref.listen(
      locationRepositoryProvider.select(
        (locationBucket) => locationBucket.live,
      ),
      (_, newLive) async {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          newLive?.latitude ?? 0.0,
          newLive?.longitude ?? 0.0,
        );
        state = state.copyWith(live: newLive, placemark: placemarks.first);
      },
    );
  }

  void onUpdateLocation() {
    ref.read(locationRepositoryProvider.notifier).updatePosition();
  }
}

final locationViewModelProvider =
    NotifierProvider<LocationViewModel, LocationState>(LocationViewModel.new);
