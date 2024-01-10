import 'package:flutter/material.dart';

import 'sound_manager.dart';

class OptionsDialog extends StatefulWidget {
  final SoundManager soundManager;
  const OptionsDialog({super.key,
  required this.soundManager
  });

  @override
  State<OptionsDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {

  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment (0,0),
        width: 130,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/settings.png'),
            fit: BoxFit.fill
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  setState(() {
                    widget.soundManager.toggleSound();
                  });
                }, 
                icon: widget.soundManager.isSoundOn? Icon(Icons.volume_up):Icon(Icons.volume_mute)
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    widget.soundManager.isSFXOn=!widget.soundManager.isSFXOn;
                  });
                }, 
                icon: widget.soundManager.isSFXOn? Icon(Icons.music_note):Icon(Icons.music_off)
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    widget.soundManager.isVibroOn=!widget.soundManager.isVibroOn;
                  });
                }, 
                icon: widget.soundManager.isVibroOn? Icon(Icons.vibration):Icon(Icons.tablet_android)
              ),
            ],
          ),
        )

          
      )
    );
  }
}