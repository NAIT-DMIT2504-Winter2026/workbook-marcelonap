import 'package:firebase_setup_in_class_demo/models/todo.dart';
import 'package:firebase_setup_in_class_demo/state/app_state.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({required this.appState, super.key});

  final ApplicationState appState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  child: Text("Placeholder"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
