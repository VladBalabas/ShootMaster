import 'package:flutter/material.dart';

import 'comps/font.dart';

class CoverScreen extends StatelessWidget {
  
  final bool hasGameStarted;
  final bool isGameOver;
  final bool isWon;
  CoverScreen({super.key, required this.hasGameStarted, required this.isGameOver, required this.isWon});

  @override
  Widget build(BuildContext context) {
    return !hasGameStarted?
     Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(isWon?'':'PRESS', style: myNewFontwhite.copyWith(fontSize: 50, fontWeight: FontWeight.bold),),
           SizedBox(height: 80,),
           Text(isWon?'':' TO ', style: myNewFontwhite.copyWith(fontSize: 50,fontWeight: FontWeight.bold),),
           SizedBox(height: 80,),
           Text(isWon?'':'START', style: myNewFontwhite.copyWith(fontSize: 50,fontWeight: FontWeight.bold),)
         ],
       ),
     )
     :Container();
  }
}