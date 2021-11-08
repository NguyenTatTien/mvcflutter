import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:game/Controllers/GameController.dart';

import 'dart:async';
import 'dart:io';

import 'package:game/Views/GameView.dart';
import 'package:momentum/momentum.dart';

void main() {
  runApp(Momentum(controllers: [GameController()],child: MyApp(),));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyApp createState()=>_MyApp();
}
class _MyApp extends State<MyApp> {
 
    @override
    Widget build(BuildContext context){
     
      return MaterialApp(
        home:HomeApp()
      );
    }
}
class HomeApp extends StatefulWidget{
  _HomeApp createState()=> _HomeApp();
}
class _HomeApp extends State<HomeApp>{
 /*  int time=10;
  int score=0;
  Timer? timer;
  Timer? changecolor;
  int time_changecolor=1;
  String correct_answer='';
  String temporary='';
  
  var animals=["bird","cat","dinasour","elephant","goat","lion","monkey","pig","tiger","zebra"];
  var choose=List.filled(4, '');
  int add=0;
  var colors=[Colors.blue,Colors.blue,Colors.blue,Colors.blue];
  final AudioCache audioCache=AudioCache();
  
  @override
  void initState(){
  
    NewGame();
   
  }
  void NewGame(){
        Random rdLocation=new Random();
        Random rdAnimals=new Random();
        int Location=rdLocation.nextInt(4);
        int Location_animal=rdAnimals.nextInt(10);
      setState(() {
         colors=[Colors.blue,Colors.blue,Colors.blue,Colors.blue];
          correct_answer=animals[Location_animal];
          choose[Location]=correct_answer;
          for(int i=0;;i++){
            if(add<4){
              if(add!=Location){
                temporary=animals[rdAnimals.nextInt(10)];
                if(!choose.contains(temporary)){
                    choose[add]=temporary;
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
              
      });
      Start();
  }
  void Start(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        if(time>0){
          time--;
        }
        else{ 
          Finish();
         
        }
      });
    });
  }
  void Finish() {
   score=0;
   showDialog(
    context: context,
    builder: (BuildContext context) {
        return AlertDialog(
      title:Text("Game over"),
      content:Text("Bạn có muốn chơi lại không!"),
      actions: [
        ElevatedButton(onPressed:(){ Navigator.of(context).pop(false);Reset();} , child: Text('Yes'),),
         ElevatedButton(onPressed:(){Navigator.of(context).pop(false);dispose();}, child: Text('No'),),
      ],
    );
      },
    );
  }
  
  void Reset(){
    time_changecolor=1;
    timer?.cancel();
    changecolor?.cancel();
    time=10;
    add=0;
    choose=List.filled(4, '');
    NewGame();
  }
  
  void Check(String answer){ 
     int index=choose.indexOf(answer);
      if(answer==correct_answer){
         
          score++;
          audioCache.play("audios/Am-thanh-tra-loi-dung-chinh-xac.mp3");
          changecolor=Timer.periodic(Duration(seconds:1), (timer) { 
            setState(() {
              if(time_changecolor>0){
                colors[index]=Colors.green;
                 time_changecolor--;
              }
              else{
                colors[index]=Colors.blue;
                Reset();
              }
            });
          });
         
         
      }
      else{
        changecolor=Timer.periodic(Duration(seconds:1), (timer) { 
            setState(() {
              if(time_changecolor>0){
                colors[index]=Colors.red;
                time_changecolor--;
              }
              else{
               
                 Finish();
              }
            });
          });
       
      }
  }*/
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
          title:Center(child:Text("Game"))

        ),
        body: GameView(context)
        );
  }
}