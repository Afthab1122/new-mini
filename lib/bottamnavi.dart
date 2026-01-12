import 'package:fitness/modules/fitness/view/calender.dart';
import 'package:fitness/modules/fitness/view/flow_chart/graff.dart';
import 'package:fitness/modules/fitness/view/home.dart';
import 'package:fitness/modules/fitness/view/profile.dart';
import 'package:flutter/material.dart';

class Bottamnavi extends StatefulWidget {
  const Bottamnavi({super.key});

  @override
  State<Bottamnavi> createState() => _BottamnaviState();
}

class _BottamnaviState extends State<Bottamnavi> {
  int _selectindex = 0;
  List<Widget> pages = [Home(), Graff(), Calender(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF232323),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectindex,
        onTap: (int index) {
          setState(() {
            _selectindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined, size: 40),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_sharp, size: 40),
            label: '',
          ),
        ],
      ),
    );
  }
}
