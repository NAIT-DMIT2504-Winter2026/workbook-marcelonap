import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screens/home_screen.dart';
import 'package:riverpod_example/screens/last_name_screen.dart';
import 'package:riverpod_example/screens/todo_list.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/last-name-screen': (context) => LastNameScreen(),
        '/login': (context) => SignInScreen(
          actions: [
            AuthStateChangeAction((context, state) {
              final user = switch (state) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null,
              };
              if (user == null) return;
              if (state is UserCreated) {
                user.updateDisplayName(user.email!.split('@').first);
              }

              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        ),
        '/todos': (context) => TodoList(),
      },
    );
  }
}
