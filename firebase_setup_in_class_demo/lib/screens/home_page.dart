import 'dart:io';

import 'package:firebase_setup_in_class_demo/models/todo.dart';
import 'package:firebase_setup_in_class_demo/state/app_state.dart';
import 'package:firebase_setup_in_class_demo/state/provide_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // reference to the application state (with the loggedIn info)
  final TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Listenable Builders work by calling the builder function
        // any time the listenable changes
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) {
            return appState.loggedIn
                ? Column(
                    children: <Widget>[
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/todo-list');
                        },
                        child: Text("Todo List"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: Text('Profile'),
                      ),
                      Spacer(),
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
