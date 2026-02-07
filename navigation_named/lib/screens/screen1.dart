import 'package:flutter/material.dart';
import 'package:navigation_named/constants/routes.dart';

class Screen1 extends StatefulWidget {
  final String title;
  Screen1({super.key, required this.title});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String dataHolder = '';
  final _dataController = TextEditingController();
  void _setData(String data) {
    setState(() {
      dataHolder = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _dataController.dispose(); // Always dispose of
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("This is my first screen"),
            TextField(controller: _dataController),
            if (dataHolder.isNotEmpty) Text(dataHolder),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(
            context,
          ).pushNamed(AppRouter.screen2, arguments: _dataController.text);
          if (result != null) {
            _setData(result as String);
          }
        },
      ),
    );
  }
}
