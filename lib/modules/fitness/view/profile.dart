import 'package:fitness/modules/fitness/auth/registraction.dart';
import 'package:fitness/modules/fitness/view/usermodel/usermodell.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  // ignore: prefer_typing_uninitialized_variables
  var username;
  // ignore: prefer_typing_uninitialized_variables
  var email;
  // ignore: prefer_typing_uninitialized_variables
  var higth;
  // ignore: prefer_typing_uninitialized_variables
  var weigth;
  // ignore: prefer_typing_uninitialized_variables
  var age;

  Future<void> getusername() async {
    final prefs = await SharedPreferences.getInstance();
    final name  = prefs.getString("username") ?? "";
    final emaill = prefs.getString("email") ?? "";
    higth = prefs.getString("higtht") ?? "";
    weigth = prefs.getString("weigth") ?? "";
    age = prefs.getString("age") ?? "";
    setState(() {
      username=name;
      email=emaill;
    });
  }
  Future<void>logout()async{
    final prefs=await SharedPreferences.getInstance();
    var box=Hive.box<Usermodell>('boxxy');
    box.clear();
    prefs.clear();
     
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Registraction()));
  }

@override
  void initState() {
    super.initState();
    getusername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {logout();},
                  icon: Icon(Icons.exit_to_app, size: 35, color: Colors.yellow),
                ),
              ),

              Text(
                "Profile",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              CircleAvatar(radius: 85, 
              child: Text(username.toString().split("").first,style:TextStyle(fontSize: 100) ,),),
              SizedBox(height: 30),
              Container(
                width: 400,

                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 55,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "$username",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 400,
                      height: 55,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.30),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                        
                          "$email",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "Higth$higth",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 80,
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "weigth$weigth",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 80,
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "age: $age",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Edict Profile"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
