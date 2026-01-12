import 'package:fitness/modules/fitness/view/catagary/leg/sit_up.dart';
import 'package:flutter/material.dart';

class LegDay extends StatefulWidget {
  const LegDay({super.key});

  @override
  State<LegDay> createState() => _LegDayState();
}

class _LegDayState extends State<LegDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFF232323),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.amber,),
        title: Center(
          child: Text(
            "Leg Day",
            style: TextStyle(color: Colors.yellow, fontSize: 40),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF232323),

        child: Column(
          children: [
            SizedBox(height: 10),
            Card(
              color: Colors.white.withRed(3),
              elevation: 3,
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SitUp()));
                    },
                    leading: Image.asset("assets/download.jpeg", height: 70),
                    title: Text("Situp"),
                    subtitle: Text("Leg workout"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white.withRed(3),
              elevation: 3,
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/Bodybuilder showing his muscles _ Premium Photo.jpeg",
                      height: 80,
                    ),
                    title: Text(""),
                    subtitle: Text(""),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white.withRed(3),
              elevation: 3,
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/Six Pack Abs PNG Images (Transparent HD Photo ClSix Pack Abs PNG Images (Transparent HD Photo Clipart).jpeg",
                      height: 80,
                    ),
                    title: Text(""),
                    subtitle: Text(""),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}