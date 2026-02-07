import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Second Screen")),
      body: Center(child: Column(children: <Widget>[Text("Hello $name")])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).pop("Returning data from second screen to first");
        },
        child: Text("Go Back"),
      ),
    );
  }
}
