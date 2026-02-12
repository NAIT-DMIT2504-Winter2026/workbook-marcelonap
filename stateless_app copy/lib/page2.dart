// Sample stateless widget that takes in an argument and pops back
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String name;

  const Page2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello $name"),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop("Sending something back");
              },
              child: const Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
