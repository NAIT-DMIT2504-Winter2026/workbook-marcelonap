import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// UserState wraps User so we can add more app-level fields here later
// (e.g. isLoading, errorMessage, isLoggedIn) without changing the notifier API.
class UserState {
  const UserState({required this.user});
  final User user;

  UserState copyWith({User? user}) {
    return UserState(user: user ?? this.user);
  }
}

// UserNotifier centralises all state mutations — widgets call named methods
// instead of setting .state directly. Mirrors the ApplicationState pattern
// from the firebase_setup example.
class UserNotifier extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState(
      user: User(firstName: 'John', lastName: 'Doe'),
    );
  }

  void updateFirstName(String firstName) {
    state = state.copyWith(user: state.user.copyWith(firstName: firstName));
  }

  void updateLastName(String lastName) {
    state = state.copyWith(user: state.user.copyWith(lastName: lastName));
  }
}

final userProvider = NotifierProvider<UserNotifier, UserState>(
  UserNotifier.new,
);
