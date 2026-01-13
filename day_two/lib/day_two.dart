import 'dart:io';

int calculate() {
  return 6 * 7;
}

String prompt(String message) {
  print("$message\n");
  var input = stdin.readLineSync();
  return input ?? "";
}
