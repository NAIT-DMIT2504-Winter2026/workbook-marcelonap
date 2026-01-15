import 'package:change_counter/change_counter.dart';

void main(List<String> arguments) {
  List<int> counts = promptForChange();
  int total = calculateTotalChange(counts);

  print("Total change is: ${total / 100} cents");
}
