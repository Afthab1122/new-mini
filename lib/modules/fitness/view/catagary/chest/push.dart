import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Push extends StatefulWidget {
  const Push({super.key});

  @override
  State<Push> createState() => _PushState();
}

class _PushState extends State<Push> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(
        backgroundColor:Color(0xFF232323) ,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.amber,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
        width: double.infinity,
        height: 300,
        child: 
     Lottie.asset(
         'assets/animations/Wide_arm_push_up.json',
         repeat: true,
       ),
      ),
      SizedBox(height: 20,),
      Text("duraction",style: TextStyle(color: Colors.blue, fontSize:25 ),),
      SizedBox(height: 20,),
      Center(child: Text("Introduction",style: TextStyle(color: Colors.blue, fontSize:30 ),)),
      SizedBox(height: 10,),
      Text('''A push-up is one of the most basic and effective bodyweight exercises.
    It mainly strengthens your chest, shoulders, triceps, and core muscles.
    Push-ups require no equipment — you only use your body weight — which makes them easy to do anywhere. ''',
    style: TextStyle(color: Colors.white,fontSize: 20),),
    SizedBox(height: 50,),
    Center(
      child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
     shape: BoxShape.circle,
     color: Colors.white
    ),
    child: Center(child: Text("Start",style: TextStyle(color: Colors.blue,
    fontSize: 25),)),
      ),
    )
          
        ],
      ),
    );
  }
}