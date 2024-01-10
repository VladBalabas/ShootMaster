
import 'package:flutter/material.dart';
import 'package:shoot_master/src/white/components/comps/font.dart';

class Score extends StatelessWidget {
  final int time;
  Score({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 60),
      child: Container(
          child: Column(children: [
        Text(
          'Time Left:',
          style: myNewFontwhite,
        ),
        Text(
          '$time',
          style: myNewFontwhite,
        ),
      ]
        )
      ),
    );
  }
}
