
import 'package:flutter/material.dart';

import 'package:shoot_master/src/white/initial_page.dart';

import 'comps/font.dart';
import 'comps/my_button.dart';

class GameOverScreen extends StatelessWidget {
  
  final bool isGameOver;
  final bool isWon;
  final int timeLeft;
  final Function()? onTap;

  GameOverScreen({required this.onTap,required this.isGameOver, required this.isWon, required this.timeLeft});
  @override
  Widget build(BuildContext context) {
    return isGameOver
    ? Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 16),
          ),
        Container(
          alignment: Alignment(0,-0.6),
          child: Container(
            width: 400,
            height: 240,
            child: isWon? Image.asset('assets/win.png', fit: BoxFit.cover,): Image.asset('assets/loose.png', fit: BoxFit.fill),
          ),
        ),

        !isWon
        ?Container(
          alignment: Alignment(0, 0.05),
          child: Text('Time left: $timeLeft seconds',style: looseFont.copyWith( fontSize: 40, letterSpacing: 1) )
        )
        :Container(),

        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(height: 280,),
            MyButton(
              onTap: onTap, 
              height: 40, 
              width: 250, 
              child: !isWon
              ?Text('PLAY AGAIN', style: looseFont.copyWith( fontSize: 40, letterSpacing: 1),)
              :Text('NEXT LEVEL', style: winFont.copyWith( fontSize: 40, letterSpacing: 1) )
            ),
          const SizedBox(height: 40,),
          MyButton(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitialPage()));
              }, 
              height: 40, 
              width: 230, 
              child: !isWon
              ?Text('MAIN MENU', style: looseFont.copyWith( fontSize: 40, letterSpacing: 1),)
              :Text('MAIN MENU', style: winFont.copyWith( fontSize: 40, letterSpacing: 1),)
            )
          
            ],
          ),
        )
      ]
    )
    :Container();
  }
}