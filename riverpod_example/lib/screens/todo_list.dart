import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/repositories/todo_repository.dart';
import 'package:riverpod_example/state/user_notifier.dart';

class TodoList extends ConsumerWidget {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(userNotifierProvider);
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
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
                      ref.read(userNotifierProvider.notifier).onDelete(item);
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
                ref
                    .read(userNotifierProvider.notifier)
                    .onAdd(Todo(description: fieldController.text));
                fieldController.clear();
              },
              child: Text('Add todo'),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userNotifierProvider.notifier).getUserTodos();
        },
      ),
    );
  }
}
