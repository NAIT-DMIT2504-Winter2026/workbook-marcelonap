import 'dart:io';

int calculate() {
  return 6 * 7;
}

String prompt({String message = "Please Input something: "}) {
  print("$message\n");
  var input = stdin.readLineSync();
  return input ?? "";
}

String promptNoNamed(String message) {
  print("$message \n");
  var input = stdin.readLineSync();
  return input ?? "";
}

String promptOptional([String message = "Please Input something: "]) {
  print("$message\n");
  var input = stdin.readLineSync();
  return input ?? "";
}
