import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:game/Controllers/GameController.dart';
import 'package:game/Models/GameModel.dart';

class GameView extends StatelessWidget{
  
  static BuildContext? Context;
  GameView(BuildContext context){
     Context=context;
   }
  static void Finish() {
   
   showDialog(
    context:Context!,
    builder: (BuildContext context) {
        return AlertDialog(
      title:Text("Game over"),
      content:Text("Bạn có muốn chơi lại không!"),
      actions: [
        ElevatedButton(onPressed:(){ Navigator.of(context).pop(false);Momentum.controller<GameController>(context).Reset();} , child: Text('Yes'),),
         ElevatedButton(onPressed:(){Navigator.of(context).pop(false);}, child: Text('No'),),
      ],
    );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
           MomentumBuilder(controllers:[GameController],builder: (context, snapshot){
              var model=snapshot<GameModel>();
              
              return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
            child:Container(
              child:Text("Time: ${model.time}",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),),
              margin:EdgeInsets.only(top: 5),
              height: double.infinity,
            )),flex: 1,),
            Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
            child: Container(
              child:Text("Score: ${model.score}",textAlign: TextAlign.center,style: TextStyle(color: Colors.green)),
               height: double.infinity,
               
            )),flex:1),
            Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
            child: Container(
              child: Image.asset("assets/images/${model.image}.png"),
              margin:EdgeInsets.only(top: 3,bottom: 3)
            )),flex: 6,),
          
             Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
                child: Container(
                  child:ElevatedButton(onPressed: ()=>Momentum.controller<GameController>(context).Check(model.answer_one!), child: Text(model.answer_one!),style:ElevatedButton.styleFrom(primary: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  margin:EdgeInsets.only(top: 3,bottom: 3)

                )),flex:2), 
                Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
                child: Container(
                  child:ElevatedButton(onPressed: ()=>Momentum.controller<GameController>(context).Check(model.answer_two!), child: Text(model.answer_two!),style:ElevatedButton.styleFrom(primary:  Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  margin:EdgeInsets.only(top: 3,bottom: 3)

                )),flex:2),
                Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
                child: Container(
                  child:ElevatedButton(onPressed: ()=>Momentum.controller<GameController>(context).Check(model.answer_three!), child: Text(model.answer_three!),style:ElevatedButton.styleFrom(primary: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  margin:EdgeInsets.only(top: 3,bottom: 3)

                )),flex:2),
                Expanded(child: ConstrainedBox(constraints: BoxConstraints.expand(),
                child: Container(
                  child:ElevatedButton(onPressed: ()=>Momentum.controller<GameController>(context).Check(model.answer_four!), child: Text(model.answer_four!),style:ElevatedButton.styleFrom(primary:  Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                  margin:EdgeInsets.only(top: 3,bottom: 3)

                )),flex:2),
                
                ],));
               

           });
         
        
  }
}