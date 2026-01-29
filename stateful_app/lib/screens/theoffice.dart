import 'package:flutter/material.dart';

class OfficePicker extends StatefulWidget {
  @override
  State<OfficePicker> createState() => _OfficePickerState();
}

class _OfficePickerState extends State<OfficePicker> {
  String imageUrl = "lib/assets/images/creed_bratton.jpeg";

  void _changePicture(String character) {
    setState(() {
      switch (character) {
        case "jim":
          imageUrl = "lib/assets/images/jim_halpert.jpeg";
          break;
        case "creed":
          imageUrl = "lib/assets/images/creed_bratton.jpeg";
          break;
        case "michael":
          imageUrl = "lib/assets/images/michael_scott.jpeg";
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(imageUrl)),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () => {
                  _changePicture("jim"),
                  print("Jim button pressed"),
                },
                child: const Text("Jim"),
              ),
              TextButton(
                onPressed: () => {
                  _changePicture('michael'),
                  print("Jim button pressed"),
                },
                child: const Text("Michael"),
              ),
              TextButton(
                onPressed: () => {
                  _changePicture('creed'),
                  print("Jim button pressed"),
                },
                child: const Text("Creed"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
