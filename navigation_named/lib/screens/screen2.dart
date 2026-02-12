import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String title;
  Screen2({super.key, required this.title});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _dataController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _dataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("I'm in screen 2"),
            TextField(controller: _dataController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(_dataController.text);
        },
      ),
    );
  }
}
