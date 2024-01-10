import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoot_master/src/white/components/comps/decorative_button.dart';

import 'package:shoot_master/src/white/components/comps/font.dart';


import 'components/options_dialog.dart';

import 'components/sound_manager.dart';
import 'game_page.dart';


class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  SoundManager soundManager = SoundManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/initial_background.jpg', fit: BoxFit.fill,),
          ),
          Container(
            alignment: Alignment(0,-0.65),
            child: Container(
              child: Image.asset('assets/logo.png')
                  
            ),
          ),

          DecorativeButton(positionX: 0, positionY: 0.124),
          DecorativeButton(positionX: 0, positionY: 0.33),
          //DecorativeButton(positionX: 0, positionY: 0.53),

          Container(
            alignment: Alignment(0,0.1),
            child: GestureDetector(
              onTap:(){ 
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GamePage()));
              },
              child: Container(
                width: 180,
                height: 60,
                
                
                child: Center(
                  child: Text(
                    'Play', 
                    style: myNewFontwhite.copyWith(
                      fontSize: 40, 
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10, 
                      color: Color.fromARGB(255, 20, 28, 17)

                    ),
                  )
                ),
              ),
            )
          ),
          Container(
            alignment: Alignment(0,0.3),
            child: GestureDetector(
              onTap:(){ 
               showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return OptionsDialog(
                      soundManager: soundManager,
                    );
                  }
                );
              },
              child: Container(
                width: 180,
                height: 60,
                
                child: Center(
                  child: Text(
                    'Options', 
                    style: myNewFontwhite.copyWith(
                      fontSize: 40, 
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1, 
                      color: Color.fromARGB(255, 20, 28, 17)

                    ),
                  )
                ),
              ),
            )
          ),
        ]
      ),
    );
  }
}