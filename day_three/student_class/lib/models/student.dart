import 'dart:io';
import 'dart:vmservice_io';

class Student {
  late String _firstName;
  late String _lastName;
  late int _student_id;
  // Unamed constructor
  // this
  Student(this._firstName, this._lastName, this._student_id);
  // instead of this
  // Student(firstName, lastName, id) {
  //   firstName = firstName;
  //   lastName = lastName;
  //   id = id;
  // }

  // Named constructor
  Student.empty() {
    _firstName = '';
    _lastName = '';
    _student_id = 0;
  }

  //Get and set First name
  String get firstName => _firstName;

  set firstName(String newValue) {
    _firstName = newValue;
  }
}
