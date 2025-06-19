import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

enum DIFFICULT { easy, normal, hard }
DIFFICULT currentDifficult = DIFFICULT.easy;
int bestScore = 0;

final Map sfxDict = {
  "button_pressed" : "sfx/button_pressed.wav",
  "correct" : "sfx/correct.wav",
  "error" : "sfx/error.wav",
  "hovered_button" : "sfx/hovered_button.wav"
};

void playSound(String effect) async{
  await AudioPlayer().play(AssetSource(effect), mode: PlayerMode.lowLatency);
}

void transitionPager(BuildContext context, page){
  FocusManager.instance.primaryFocus?.unfocus();
  
  Navigator.push(context, PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      final offsetAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

      return Opacity(
        opacity: offsetAnimation.value, 
        child: child
      );
    }
  ));
}

class MultiplicateHandle {
  final Random _rand = Random();
  List<int> numbers = [];
  int res = 1;

  void regenerateNumbers() {
    numbers.clear();
    res = 1;

    switch (currentDifficult) {
      case DIFFICULT.easy:
        for (var i = 0; i < 2; i++) {
          numbers.add(_rand.nextInt(10) + 1);
        }

      case DIFFICULT.normal:
        for (var i = 0; i < 2; i++) {
          numbers.add(_rand.nextInt(100) + 10);
        }

      case DIFFICULT.hard:
        for (var i = 0; i < 2; i++) {
          numbers.add(_rand.nextInt(100) + 1000);
        }
    }

    for (var i in numbers){
      res *= i;
    }
  }
}