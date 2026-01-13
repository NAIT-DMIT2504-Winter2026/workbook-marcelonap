import 'dart:io';
import 'package:day_two/day_two.dart';

void main(List<String> arguments) {
  var isValid = false;
  while (!isValid) {
    try {
      var userInput = prompt("Please input a number:");
      var result = int.parse(userInput);
      isValid = true;
      print("Result was a number = $result \n");
    } catch (e) {
      print("Input was not a number \n");
    }
  }
}
