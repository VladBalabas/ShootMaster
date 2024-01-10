import 'package:flutter/material.dart';

class DecorativeButton extends StatelessWidget {
  final double positionX;
  final double positionY;
  const DecorativeButton({super.key, required this.positionX, required this.positionY});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment(positionX,positionY),
            child: Container(
              width: 300,
              height: 80,
              //color: Colors.black,
              child: Center(child: Image.asset('assets/button.png',)),
            )
          );
  }
}