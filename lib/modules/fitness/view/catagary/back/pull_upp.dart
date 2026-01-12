import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Pullup extends StatefulWidget {
  const Pullup({super.key});

  @override
  State<Pullup> createState() => _PullupState();
}

class _PullupState extends State<Pullup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(backgroundColor:Color(0xFF232323) ,
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
     Lottie.asset(""
         'assets/animations/Pull Ups.json',
         repeat: true,
       ),
      ),
      SizedBox(height: 20,),
      Text("duraction",style: TextStyle(color: Colors.blue, fontSize:25 ),),
      SizedBox(height: 20,),
      Text("Introduction",style: TextStyle(color: Colors.blue, fontSize:30 ),),
      SizedBox(height: 10,),
      Text('''A pull-up is a powerful upper-body bodyweight exercise where you hang from a bar and pull your body upward until your chin reaches above the bar.
It mainly strengthens the back muscles, biceps, shoulders, and core. ''',
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
    child: Center(child: TextButton( onPressed: (){},child: Text(  "Start",style: TextStyle(color: Colors.blue,
    fontSize: 25),)),)
      ),
    )
          
        ],
      ),
    );
  }
}