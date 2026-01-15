import 'dart:io';

List<int> promptForChange() {
  // Holds values for coins from pennies -> toonies
  List<int> output = [0, 0, 0, 0, 0, 0];
  // List holding all the coin names
  List<String> coins = [
    "Pennies",
    "Nickels",
    "Dimes",
    "Quarters",
    "Loonies",
    "Toonies",
  ];

  for (var i = 0; i < coins.length; i++) {
    print("How many ${coins[i]} do you have?");
    output[i] = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  }

  return output;
}

int calculateTotalChange(List<int> changeCounts) {
  List<int> coinValues = [1, 5, 10, 25, 100, 200];
  int totalChange = 0;
  for (var i = 0; i < changeCounts.length; i++) {
    totalChange += changeCounts[i] * coinValues[i];
  }
  return totalChange;
}
