import 'package:geolocation_example/data_sources/geolocation_data_source.dart';
import 'package:geolocation_example/models/location_bucket.dart';
import 'package:riverpod/riverpod.dart';

class LocationRepository extends Notifier<LocationBucket> {
  @override
  LocationBucket build() {
    // TODO: implement build
    return LocationBucket(current: null, last: null);
  }

  Future<void> updatePosition() async {
    final newCurrent = await ref
        .read(LocationDataSourceProvider)
        .getCurrentPosition();
    print('Position received $newCurrent');
    state = state.copyWith(last: state.current, current: newCurrent);
  }
}

final locationRepositoryProvider =
    NotifierProvider<LocationRepository, LocationBucket>(
      LocationRepository.new,
    );
