import 'package:student_class/models/student.dart';

void main(List<String> arguments) {
  Student test = Student("Marcelo", "Sampaio", 1);
  Student empty = Student.empty();
  print("${test.firstName}");
  empty.firstName = "123";
  print("${empty.firstName.length}");
}
