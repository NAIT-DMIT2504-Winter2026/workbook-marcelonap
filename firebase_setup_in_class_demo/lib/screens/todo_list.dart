import 'package:firebase_setup_in_class_demo/models/todo.dart';
import 'package:firebase_setup_in_class_demo/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) {
            return Column(
              children: <Widget>[
                Spacer(),

                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: appState.todoList.length,
                    itemBuilder: (context, index) {
                      final item = appState.todoList[index];
                      return Dismissible(
                        key: UniqueKey(),
                        child: ListTile(
                          title: Text(item.description),
                          trailing: Checkbox(
                            value: item.isDone,
                            onChanged: (newValue) {
                              // Update database
                            },
                          ),
                        ),
                        onDismissed: (direction) {
                          print("onDismissed: $direction");
                          appState.onDelete(item);
                        },
                      );
                    },
                  ),
                ),

                Spacer(),
                SizedBox(height: 60.0),
                TextField(controller: fieldController),
                ElevatedButton(
                  onPressed: () {
                    appState.onAdd(Todo(description: fieldController.text));
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
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
