import 'package:flutter/material.dart';

class Footballer extends StatelessWidget {
  final double footballerX;
  final double footballerY;
  final double footballerWidth;
  final String path;
  const Footballer({super.key, 
  required this.footballerX, 
  required this.footballerY,
  required this.path,
  required this.footballerWidth
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2*footballerX+footballerWidth)/(2-footballerWidth), footballerY),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * footballerWidth / 2,
        decoration: BoxDecoration(
            //color: Colors.black,
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}