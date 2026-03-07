import 'package:flutter/material.dart';

import 'package:riverpod_test/models/user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastNamePage extends ConsumerWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Last Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            Text(
              'User name: ${userState.user.firstName} ${userState.user.lastName}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userProvider.notifier).updateLastName('NewLastName');
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
