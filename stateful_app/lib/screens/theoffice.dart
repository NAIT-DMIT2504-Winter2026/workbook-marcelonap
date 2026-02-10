import 'package:flutter/material.dart';
import 'package:stateful_app/cosnt/asset_manager.dart';

class OfficePicker extends StatefulWidget {
  @override
  State<OfficePicker> createState() => _OfficePickerState();
}

class _OfficePickerState extends State<OfficePicker> {
  String imageUrl = "lib/assets/images/creed_bratton.jpeg";
  final _fieldController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fieldController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _changePicture(String character) {
    setState(() {
      imageUrl = Assets.getAsset(character);
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
          TextField(
            controller: _fieldController,
            decoration: InputDecoration(label: Text("Who do you want to see?")),
          ),
          TextButton(
            onPressed: () {
              _changePicture(_fieldController.text);
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
