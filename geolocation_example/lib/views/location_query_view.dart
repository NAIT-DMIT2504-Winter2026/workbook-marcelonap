import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocation_example/view_models/location_view_model.dart';

class LocationQueryView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationViewModelProvider);
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Last Location: ${state.last.toString()} "),
            Text("Current Location: ${state.current.toString()} "),
            SizedBox(height: 20.0),
            Text(
              "Live Location: ${state.live.toString()}",
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 0, 100, 255),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${state.placemark?.locality} - ${state.placemark?.administrativeArea} - ${state.placemark?.country}",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(locationViewModelProvider.notifier).onUpdateLocation();
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
