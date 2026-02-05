import 'package:flutter/material.dart';

class GestureTester extends StatefulWidget {
  void Function(String) onClick;
  String title;

  GestureTester({required this.onClick, required this.title});

  @override
  State<GestureTester> createState() => _GestureTesterState();
}

class _GestureTesterState extends State<GestureTester> {
  @override
  void initState() {
    super.initState();
    if (mounted) print(widget.title);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Text(widget.title),
          GestureDetector(
            onLongPress: () {
              print("Creed was long pressed");
            },
            onDoubleTap: () {
              print("Creed was double tapped");
            },
            onTap: () {
              print("Creed was tapped");
              widget.onClick("This came from GestureTester");
            },
            child: Image(
              image: AssetImage("lib/assets/images/creed_bratton.jpeg"),
            ),
          ),
        ],
      ),
    );
  }
}
