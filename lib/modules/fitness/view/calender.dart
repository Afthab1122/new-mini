import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
   DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Map<DateTime, List<String>> events = {
    DateTime.utc(2025, 11, 4): ['Meeting', 'Gym'],
    DateTime.utc(2025, 11, 5): ['Doctor Appointment'],
  };
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
      appBar: AppBar(
        backgroundColor: Color(0xFF232323) ,
        title: Center(
          child: Text(
            "Calendar",
            style: TextStyle(
              
              color: Colors.yellow,
              fontWeight: FontWeight.w900,
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(
              "Set your reminder",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.yellow),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: TableCalendar(
                  locale: 'en_US',
                  rowHeight: 56,
                  headerStyle: const HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.white),
                    formatButtonVisible: true,
                    titleCentered: true,
                    
                  ),
                  focusedDay: today,
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  onDaySelected: _onDaySelected,
                  calendarFormat: CalendarFormat.month,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  eventLoader: (day) => events[day] ?? [],
                  calendarStyle: CalendarStyle(
                    
                    defaultTextStyle: TextStyle(color: Colors.white),
                    selectedDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text("Selected Day: ${today.toLocal()}".split(' ')[0]),
        ],
      ),
    );
  }
}