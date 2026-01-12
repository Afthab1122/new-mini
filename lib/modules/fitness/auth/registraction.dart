import 'package:fitness/modules/fitness/auth/customcontainer.dart';
import 'package:fitness/modules/fitness/auth/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registraction extends StatefulWidget {
  const Registraction({super.key});

  @override
  State<Registraction> createState() => _RegistractionState();
}

class _RegistractionState extends State<Registraction> {
  final _useremail = TextEditingController();
  final _userpassword = TextEditingController();
  final _comformpass = TextEditingController();
  final _higth = TextEditingController();
  final _weigth = TextEditingController();
  final _age = TextEditingController();



  Future<void> adduser() async {
    var prefs = await SharedPreferences.getInstance();
  
  // var uuid = Uuid().v4();
    // Registermodel user = Registermodel(
    //   id: uuid,
    //   email: _useremail.text,
    //   password: _userpassword.text,
    //   comformpass: _comformpass.text,
    //   higtht: _higth.text,
    //   weigth: _weigth.text,
    //   age: _age.text,
    // );
    // box.put(uuid, user);

    prefs.setString("higtht", _higth.text.trim());
    prefs.setString("weigth", _weigth.text.trim());
    prefs.setString("age",_age.text.trim());
    prefs.setBool("logingg", true);
    prefs.setString("pass", _userpassword.text.trim());
    prefs.setString("comformpasss", _comformpass.text.trim());
    prefs.setString("email", _useremail.text.trim());
   
    if (_userpassword.text.trim() == _comformpass.text.trim()) {
       Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
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
                Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 600,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextField(
                            controller: _useremail,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(width: 2),
                              ),
                              label: Text(
                                "Email",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            controller: _userpassword,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(width: 2),
                              ),
                              label: Text(
                                "Password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            controller: _comformpass,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(width: 2),
                              ),
                              label: Text(
                                "Comform Password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Containercustom(
                                controller: _higth,
                                hint: "Higtht",
                                // ignore: deprecated_member_use
                                bgcolol: Colors.white.withOpacity(0.1),
                              ),
                              Containercustom(
                                controller: _weigth,
                                hint: "Weigth",
                                // ignore: deprecated_member_use
                                bgcolol: Colors.white.withOpacity(0.1),
                              ),
                              Containercustom(
                                controller: _age,
                                hint: "Age",
                                // ignore: deprecated_member_use
                                bgcolol: Colors.white.withOpacity(0.1),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.yellow,
                            ),
                            child: TextButton(
                              onPressed: () {
                                adduser();
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
