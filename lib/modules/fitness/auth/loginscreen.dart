import 'package:fitness/bottamnavi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _name = TextEditingController();
  final _pass = TextEditingController();

  
  // ignore: prefer_typing_uninitialized_variables
  var registerpass;
  // ignore: prefer_typing_uninitialized_variables
  var logpass;
  Future<void> loginp() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("username", _name.text);
     prefs.setString("userpass", _pass.text); 
    registerpass = prefs.getString("comformpasss");
   
    if (_pass.text == registerpass) {
      Navigator.pushReplacement(
        
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => Bottamnavi()),
      );
    } else {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text("Notcorrect")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Welocome back",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  "Use your credentials below and",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "login to your account",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 40),
                Container(
                  width: 350,
                  child: Column(
                    children: [
                      TextField(
                        controller: _name,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),
                          label: Text(
                            "UserName",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _pass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 2),
                          ),

                          label: Text(
                            "Password",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.yellow,
                        ),
                        child: TextButton(
                          onPressed: () {
                            loginp();
                          },
                          child: Text("Login", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
