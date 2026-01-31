import 'package:flutter/material.dart';

class DraggableBox extends StatefulWidget {
  @override
  _DraggableBoxState createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset position = Offset(
    100,
    100,
  ); // Member varialbe of the state to track position

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  position += details.delta;
                });
              },
              onPanStart: (details) {
                print("@onPanStart.DraggableBox: Pan Started: $details");
              },
              onPanEnd: (details) {
                print("@onPanEnd.DraggableBox: Pan Ended: $details");
              },
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
