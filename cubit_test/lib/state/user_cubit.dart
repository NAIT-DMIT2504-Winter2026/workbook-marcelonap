import 'package:cubit_test/models/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// Wrap our user in a user state in case we want to add other data in the future (isLoading, errorMessage, etc.)
class UserState {
  UserState(User user) {
    _user = user;
  }
  late final User _user;
  User get user => _user;
  set user(User newUser) {
    _user = newUser;
  }
}

class UserCubit extends Cubit<UserState> {
  // Initialize the cubit with a default user to start, it will be replaced below
  UserCubit() : super(UserState(User("Bobby", "Marlone")));

  // Public Method to emit new User States
  void updateUser(User user) {
    emit(UserState(user));
  }
}
