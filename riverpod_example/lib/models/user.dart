import 'package:riverpod_example/models/todo.dart';

class User {
  const User({required this.firstName, required this.lastName});
  final String firstName;
  final String lastName;

  User copyWith({String? firstName, String? lastName}) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}

class UserState {
  const UserState({required this.user, required this.todoList});

  final User user;
  final List<Todo> todoList;

  UserState copyWith({User? user, List<Todo>? todoList}) {
    return UserState(
      user: user ?? this.user,
      todoList: todoList ?? this.todoList,
    );
  }
}
