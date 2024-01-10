import 'package:flutter/material.dart';

class Goalkeeper extends StatelessWidget {
  final double goalkeeperX;
  final double goalkeeperY;
  final double goalkeeperWidth;
  const Goalkeeper({super.key, required this.goalkeeperX, required this.goalkeeperY, required this.goalkeeperWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2*goalkeeperX+goalkeeperWidth)/(2-goalkeeperWidth), goalkeeperY),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width*goalkeeperWidth/2,
        decoration: BoxDecoration(
            //color: Colors.black,
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          'assets/goalkeeper.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
