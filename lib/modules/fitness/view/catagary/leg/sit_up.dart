import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SitUp extends StatefulWidget {
  const SitUp({super.key});

  @override
  State<SitUp> createState() => _SitUpState();
}

class _SitUpState extends State<SitUp> {
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
         'assets/animations/Jumping_squats.json',
         repeat: true,
       ),
      ),
      SizedBox(height: 20,),
      Text("duraction",style: TextStyle(color: Colors.blue, fontSize:25 ),),
      SizedBox(height: 20,),
      Text("Introduction",style: TextStyle(color: Colors.blue, fontSize:30 ),),
      SizedBox(height: 10,),
      Text('''A sit-up is a classic bodyweight exercise that mainly targets the abdominal muscles.
It involves lying on your back and lifting your upper body toward your knees.
Sit-ups help strengthen the core, including the rectus abdominis (six-pack muscles), hip flexors, and lower back. ''',
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