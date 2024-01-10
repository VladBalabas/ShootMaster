import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shoot_master/src/white/components/footballer.dart';
import 'package:shoot_master/src/white/components/goalkeeper.dart';
import 'package:shoot_master/src/white/components/score.dart';

import 'components/ball.dart';
import 'components/coverscreen.dart';
import 'components/gameoverscreen.dart';


class GamePage extends StatefulWidget {
  


  @override
  State<GamePage> createState() => _GamePageState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _GamePageState extends State<GamePage> {

  final myNewFontwhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));

  var ballXDirection = direction.LEFT;
  var ballYDirection = direction.DOWN;
  double ballX = 0;
  double ballY = 0;
  double ballXIncrements = 0.02;
  double ballYIncrements = 0.01;

  double footballerX = 0;
  double footballerY=0.9;
  double footballerWidth = 0.4;
  String footballerPath='assets/footballer_left.png';

  double goalkeeperX=0;
  double goalkeeperY=-0.8;
  double goalkeeperWidth=0.4;

  bool hasGameStarted = false;
  bool isGameOver = false;
  bool isWon = false;

  int time=5;
  int timeLeft=0;
  Timer? timer;

  @override
  void initState() {
    timeLeft=time;
    super.initState();
  }

  void startGame() {
    hasGameStarted = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (hasGameStarted&&!isGameOver) timeLeft--;
        else timer.cancel();
      });
    });
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        updateDirection();
        moveBall();
        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
        }
      if (timeLeft==0){
        timer.cancel(); 
        isWon=true;
        isGameOver=true;
        hasGameStarted=false;
      }

      });
    });
  }
  
  void resetGame() {
    setState(() {
      footballerX = 0;
      ballX = 0;
      ballY = 0;
      isGameOver = false;
      hasGameStarted = false;
      if (isWon) time+=60;
      isWon = false;
      
      timeLeft=time;
    });
  }
  void changePath(double dx) {
  if (dx > 0) {
    footballerPath = 'assets/footballer_right.png';
  } else if (dx < 0) {
    footballerPath = 'assets/footballer_left.png';
  }
}
bool isPlayerDead() {
    if (ballY >= 1.2) {
      return true;
    }
    return false;
  }
  void updateDirection() {
    if (ballY > 0.9 && ballX >= footballerX && ballX <= footballerWidth + footballerX) {
      ballYDirection = direction.UP;
    } else if (ballY <= goalkeeperY) {
      ballYDirection = direction.DOWN;
    }

    if (ballX >= 1) {
      ballXDirection = direction.LEFT;
    } else if (ballX <= -1) {
      ballXDirection = direction.RIGHT;
    }
  }

  void moveBall() {
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXIncrements;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXIncrements;
      }

      if (ballYDirection == direction.DOWN) {
        ballY += ballYIncrements;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballYIncrements;
      }
    });
  }
  void handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      footballerX += details.delta.dx / MediaQuery.of(context).size.width;
      if (footballerX < -1) {
        footballerX = -1;
      } else if (footballerX + footballerWidth > 1) {
        footballerX = 1 - footballerWidth;
      }
      changePath(details.delta.dx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: hasGameStarted&&!isGameOver? handleDragUpdate:null,
      onTap: startGame,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
              child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/gamebackground.png', fit: BoxFit.fill,)
              ),
              CoverScreen(
                hasGameStarted: hasGameStarted,
                isGameOver: isGameOver,
                isWon: isWon,
              ),
              
              Goalkeeper(
                goalkeeperX: ballX-goalkeeperWidth/2,
                goalkeeperY: goalkeeperY,
                goalkeeperWidth: goalkeeperWidth
              ),
              
              MyBall(
                ballX: ballX,
                ballY: ballY,
                hasGameStarted: hasGameStarted,
                isGameOver: isGameOver,
                isWon: isWon,
              ),
              Footballer
              (
                footballerX: footballerX,
                footballerY: footballerY,
                footballerWidth: footballerWidth,
                path: footballerPath,
              ), 
              Score(
                time: timeLeft
              ),
              GameOverScreen(
                isGameOver: isGameOver,
                isWon: isWon,
                timeLeft: timeLeft,
                onTap: resetGame,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
