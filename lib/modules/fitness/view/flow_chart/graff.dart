import 'package:fitness/modules/fitness/view/usermodel/usermodell.dart';
import 'package:fitness/modules/fitness/view/userservice/userservices.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graff extends StatefulWidget {
  const Graff({super.key});

  @override
  State<Graff> createState() => _GraffState();
}

class _GraffState extends State<Graff> {
  final userservice = Userservices();
  List<Usermodell> getWork = [];
  int back = 0;
  int leg = 0;
  int chest = 0;

  Future<void> getAll() async {

    back = await userservice.getAllBack();
    leg = await userservice.getAllLeg();
    chest = await userservice.getAllChest();

    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    final total = back + leg + chest;
    final backVal = (back <= 0 && total == 0) ? 1.0 : back.toDouble();
    final legVal = (leg <= 0 && total == 0) ? 1.0 : leg.toDouble();
    final chestVal = (chest <= 0 && total == 0) ? 1.0 : chest.toDouble();

    return Scaffold(
      backgroundColor:Color(0xFF232323),
      appBar: AppBar(
        backgroundColor: Color(0xFF232323),
        title: const Text('Workout chart',style: TextStyle(color: Colors.amber,
        fontSize: 30 
        ),)),
      body: Column(
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                sections: [
                  PieChartSectionData(
                    color: const Color.fromARGB(255, 244, 54, 54),
                    radius: 70,
                    value: backVal,
                    title: 'Back\n$back',
                    titleStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    titlePositionPercentageOffset: 0.6,
                  ),
                  PieChartSectionData(
                    color: const Color.fromARGB(255, 255, 238, 0),
                    radius: 70,
                    value: legVal,
                    title: 'Leg\n$leg',
                    titleStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    titlePositionPercentageOffset: 0.6,
                  ),
                  PieChartSectionData(
                    color: const Color.fromARGB(255, 0, 255, 8),
                    radius: 70,
                    value: chestVal,
                    title: 'Chest\n$chest',
                    titleStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    titlePositionPercentageOffset: 0.6,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 140,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  gaugeCard("Back", back, const Color.fromARGB(255, 244, 54, 54), total),
                  const SizedBox(width: 12),
                    gaugeCard("Leg", leg, const Color.fromARGB(255, 255, 238, 0), total),
                  const SizedBox(width: 12),
                  gaugeCard("Chest", chest, const Color.fromARGB(255, 0, 255, 8), total),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget gaugeCard(String title, int ss, Color color, int total) {
    final percent = (total == 0) ? 0.0 : (ss / total).clamp(0.0, 1.0);
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                '$ss workout${ss == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 12,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${(percent * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
