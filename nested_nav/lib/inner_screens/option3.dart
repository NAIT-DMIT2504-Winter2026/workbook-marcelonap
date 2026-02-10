import 'package:flutter/material.dart';
import 'package:nested_nav/constants/controllers.dart';

class Option3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Option 3"),
          TextField(controller: fieldController),
        ],
      ),
    );
  }
}
