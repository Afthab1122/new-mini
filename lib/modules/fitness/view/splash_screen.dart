
import 'dart:async';

import 'package:fitness/bottamnavi.dart';
import 'package:fitness/modules/fitness/auth/registraction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Future<bool> _checkUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logingg") ?? false;
  }

   
 @override
  void initState() {
    super.initState();
   Timer(Duration(seconds: 03),()async{
    final isLoged=await _checkUserStatus();
   if(isLoged==true){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bottamnavi()));
   }
   else{
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Registraction()));
   }
   });  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/iPhone 16 Pro - 9.png"),
    );
  }
}