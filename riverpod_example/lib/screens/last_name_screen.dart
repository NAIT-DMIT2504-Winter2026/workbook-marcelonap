import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state/user_notifier.dart';

class LastNameScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Text(
            "Welcome ${userState.user.firstName} ${userState.user.lastName}",
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Go to previous page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/todos');
            },
            child: Text("Go to next page"),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(userNotifierProvider.notifier)
              .updateLastName("New last name");
        },
        child: Text("Change name"),
      ),
    );
  }
}
