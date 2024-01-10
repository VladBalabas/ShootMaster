import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  
  final ballX;
  final ballY;
  final hasGameStarted;
  final isGameOver;
  final isWon;
  MyBall({this.ballX, this.ballY, this.hasGameStarted,this.isGameOver, this.isWon});
  @override
  Widget build(BuildContext context) {
    return hasGameStarted
    ? Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: isGameOver? Colors.grey[200]:Colors.grey[400],
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/ball.png'),
      ),
    )
    :Container();
    
  }
}