import 'dart:io';

import 'package:firebase_setup_in_class_demo/models/todo.dart';
import 'package:firebase_setup_in_class_demo/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.appState, super.key});

  // reference to the application state (with the loggedIn info)
  final ApplicationState appState;
  final TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Listenable Builders work by calling the builder function
        // any time the listenable changes
        child: ListenableBuilder(
          listenable: appState,
          builder: (context, _) {
            return appState.loggedIn
                ? Column(
                    children: <Widget>[
                      TextField(controller: fieldController),
                      ElevatedButton(
                        onPressed: () {
                          appState.addTodo(
                            Todo(description: fieldController.text),
                          );
                          fieldController.clear();
                        },
                        child: Text('Add todo'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: Text('Profile'),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text('Sign In'),
                  );
          },
        ),
      ),
    );
  }
}
