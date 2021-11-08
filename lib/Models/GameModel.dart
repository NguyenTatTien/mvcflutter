import 'package:momentum/momentum.dart';
import 'package:game/Controllers/GameController.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class GameModel extends MomentumModel<GameController>{
    String ?image;
    int? score;
    int? time;
    String? answer_one;
    String? answer_two;
    String? answer_three;
    String? answer_four;
   
    GameModel(GameController controller,{required this.image, this.answer_one,this.answer_two,this.answer_three,this.answer_four,this.time,this.score}):super(controller);
    @override
  void update({String ?image,String? answer_one,String? answer_two,String? answer_three,String? answer_four,int?time,int?score,var colors}) {
     
      GameModel(controller,image: image,answer_one:answer_one, answer_two:answer_two, answer_three:answer_three, answer_four:answer_four,time: time,score: score).updateMomentum();
  }
 
  
  
}