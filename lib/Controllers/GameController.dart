import 'dart:math';

import 'package:game/Views/GameView.dart';
import 'package:momentum/momentum.dart';
import 'package:game/Models/GameModel.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class GameController extends MomentumController<GameModel>{
  var animals=["bird","cat","dinasour","elephant","goat","lion","monkey","pig","tiger","zebra"];
  var colors=[Colors.blue,Colors.blue,Colors.blue,Colors.blue];
  final AudioCache audioCache=AudioCache();
  String ?correct_answer;
  Random rdLocation=new Random();
  Random rdAnimals=new Random();
  var answers=List.filled(4, '');
   Timer? timer;
   int time=10;
  int? Location;
  int add=0;
  int? Location_animal;
  String temporary='';
  int score=0;
 // bool? click;
  @override
  GameModel init(){
   
    Reset();
   
    return GameModel(this,image: correct_answer,answer_one: answers[0],answer_two: answers[1],answer_three: answers[2],answer_four: answers[3],time:time,score:score);
  }
  void Reset(){
    timer?.cancel();
     time=10;
      add=0;
      answers=List.filled(4, '');
      Location=rdLocation.nextInt(4);
      Location_animal=rdAnimals.nextInt(10);
    //  colors=[Colors.blue,Colors.blue,Colors.blue,Colors.blue];
          correct_answer=animals[Location_animal!];
          answers[Location!]=correct_answer!;
          for(int i=0;;i++){
            if(add<4){
              if(add!=Location){
                temporary=animals[rdAnimals.nextInt(10)];
                if(!answers.contains(temporary)){
                    answers[add]=temporary;
                    add++;
                }
                
            }
            else{
              add++;
            }
              
              
            }
            else{
                break;
              }
          }
          Start();
  }
  void Check(String answer){ 
   ////Timer? changecolor;
  
   //int time_changecolor=1;
   
     int index=answers.indexOf(answer);
      if(answer==animals[Location_animal!]){
          score++;
          audioCache.play("audios/Am-thanh-tra-loi-dung-chinh-xac.mp3");
           
              model.update(image: correct_answer,answer_one:answers[0],answer_two:answers[1],answer_three:answers[2],answer_four:answers[3],time: time,score:score);
            
     

                
             Reset();
         
         
         
     
      }
   else{
      audioCache.play("audios/Tieng-bao-sai.mp3");
    
       
             
      model.update(image: correct_answer,answer_one:answers[0],answer_two:answers[1],answer_three:answers[2],answer_four:answers[3],time: time,score:score);
             
         
                
      Finish();
         
       
      //}
    }
  }
  void Start(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) { 
      
        if(time>=0){
          model.update(image: correct_answer,answer_one:answers[0],answer_two:answers[1],answer_three:answers[2],answer_four:answers[3],time: time,score:score);
          time--;
          
        }
        else{ 
        audioCache.play("audios/Tieng-bao-sai.mp3");
         Finish();
         
        }
      });
    
  }
  void Finish(){
     score=0;
     timer?.cancel();
     GameView.Finish();
  }
}