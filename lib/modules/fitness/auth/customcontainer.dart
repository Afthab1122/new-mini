import 'package:flutter/material.dart';

class Containercustom extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final Color bgcolol;
  
  const Containercustom(
    {super.key,
    required this.controller,
    required this.hint,
    required this.bgcolol
    }   
    );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgcolol
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          hint: Center(child: Text(hint,style: TextStyle(color: Colors.white,
          fontSize: 15))),
          border: InputBorder.none
        ),       
      ),
    );
  }
} 