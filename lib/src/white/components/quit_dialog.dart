import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoot_master/src/white/components/comps/font.dart';


class QuitDialog extends StatelessWidget {
  const QuitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Center(child: Text('Are you sure?', style: myNewFontwhite,)),
      
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('NO', style: myNewFontwhite.copyWith(color:Color.fromRGBO(255, 255, 255, 100), fontSize: 20),)
            ),
            TextButton(
              onPressed: (){
                SystemNavigator.pop();
              }, 
              child: Text('YES', style: myNewFontwhite.copyWith(color:Color.fromARGB(255, 238, 37, 37), fontSize: 20),)
            ),
          ],
        )
      ],
    );
  }
}