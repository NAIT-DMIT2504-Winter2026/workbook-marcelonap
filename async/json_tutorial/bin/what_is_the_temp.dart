import 'package:what_is_the_temp/what_is_the_temp.dart' as what_is_the_temp;
import 'dart:convert';

void main(List<String> arguments) {
  var jsonString = '''
  [
    {
      "weather": "-10",
      "city": "Edmonton",
      "time":"7:36"
    } 
  ]
''';
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };
  var scores = jsonDecode(jsonString);
  // print(jsonString[0]);
  print(scores);
  print(scores[0]['weather']);
  print(scores[0]['city']);
  print(scores[0]['time']);
  // print(gifts['first']);
  print("Today's Temp is:  ${what_is_the_temp.getTemp()}!");
}
