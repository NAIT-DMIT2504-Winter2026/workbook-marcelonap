class User {
  User(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
  }

  late final String _firstName;
  late final String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;
}
