import 'dart:io';
import 'package:day_two/day_two.dart';

void main(List<String> arguments) {
  var isValid = false;
  List dynamicList = [1, 2, 3];
  dynamicList.add("Hello");
  dynamicList.add("World");

  List<String> stringList = ["Hello", "World"];

  print(dynamicList);
  while (!isValid) {
    try {
      var emptyPrompt = prompt();
      var userInput = prompt(message: "Please input a number:");
      var userInput2 = promptNoNamed("Please input a number:");
      var result = int.parse(userInput);
      isValid = true;
      print("Result was a number = $result \n");
    } catch (e) {
      print("Input was not a number \n");
    }
  }
}
