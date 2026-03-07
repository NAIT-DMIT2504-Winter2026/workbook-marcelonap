import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state/user_notifier.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Text("Welcome ${userState.user.firstName}"),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/last-name-screen");
            },
            child: Text("Go to other page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/login");
            },
            child: Text("Log in"),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userNotifier.updateFirstName("New first name");
        },
        child: Text("Change name"),
      ),
    );
  }
}
