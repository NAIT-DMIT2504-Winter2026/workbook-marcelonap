import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class FirstNamePage extends ConsumerWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('First Name Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24.0),
            Text(
              'User name: ${userState.user.firstName} ${userState.user.lastName}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userProvider.notifier).updateFirstName('Micycle');
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
