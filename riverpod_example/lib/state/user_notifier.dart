import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/models/todo.dart';
import 'package:riverpod_example/models/user.dart';
import 'package:riverpod_example/repositories/todo_repository.dart';

class UserNotifier extends Notifier<UserState> {
  @override
  UserState build() {
    // TODO: implement build
    ref.read(todoRepositoryProvider).init();
    return UserState(
      user: User(firstName: "Test", lastName: "Riverpod"),
      todoList: List.empty(),
    );
  }

  void getUserTodos() {
    state = state.copyWith(
      todoList: ref.watch(todoRepositoryProvider).todoList,
    );
  }

  void updateFirstName(String firstName) {
    state = state.copyWith(user: state.user.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    state = state.copyWith(user: state.user.copyWith(lastName: lastName));
  }

  void onDelete(Todo todoToDelete) async {
    await ref.read(todoRepositoryProvider).onDelete(todoToDelete);
    getUserTodos();
  }

  void onAdd(Todo newTodo) async {
    await ref.read(todoRepositoryProvider).onAdd(newTodo);
    getUserTodos();
  }
}

final userNotifierProvider = NotifierProvider<UserNotifier, UserState>(
  UserNotifier.new,
);
