import 'package:geolocation_example/models/location_bucket.dart';
import 'package:geolocation_example/repositories/geolocation_repository.dart';
import 'package:riverpod/riverpod.dart';

class LocationViewModel extends Notifier<LocationState> {
  @override
  LocationState build() {
    subscribeToLocationUpdates();
    // TODO: implement build
    return LocationState(current: null, last: null);
  }

  void subscribeToLocationUpdates() {
    ref.listen(
      locationRepositoryProvider.select(
        (locationBucket) => locationBucket.current,
      ),
      (oldCurrent, newCurrent) {
        state = state.copyWith(last: oldCurrent, current: newCurrent);
      },
    );
  }

  void onUpdateLocation() {
    ref.read(locationRepositoryProvider.notifier).updatePosition();
  }
}

final locationViewModelProvider =
    NotifierProvider<LocationViewModel, LocationState>(LocationViewModel.new);
