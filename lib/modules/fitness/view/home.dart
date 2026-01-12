// ignore_for_file: deprecated_member_use

import 'package:fitness/modules/fitness/view/catagary/back/back_day.dart';
import 'package:fitness/modules/fitness/view/catagary/chest/chest_day.dart';
import 'package:fitness/modules/fitness/view/catagary/leg/leg_day.dart';
import 'package:fitness/modules/fitness/view/usermodel/usermodell.dart';
import 'package:fitness/modules/fitness/view/userservice/userservices.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final workoutnamecontro = TextEditingController();
  final duractioncontro = TextEditingController();
  final descriptioncontro = TextEditingController();

  final Userservices _userservices = Userservices();
  List<Usermodell> getworkout = [];

  String? selectvalue;
  String? newvalue;
  List<String> catagoryList = ["chest", "back", "leg"];

  @override
  void initState() {
    _userservices.getworkout();
    super.initState();
  }

  Future<void> editdailog(int index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white.withOpacity(0.7),
          title: Text(
            "Edict Workout",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          actions: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              value: newvalue,
              items: catagoryList.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                selectvalue = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                final updateworkout = Usermodell(
                  id: DateTime.now().toString(),
                  catagary: selectvalue!,
                );
                _userservices.updateworkout(index, updateworkout);
                Navigator.pop(context);
              },
              child: Text("update"),
            ),
          ],
        );
      },
    );
  }

  Future<void> dailogbox() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          backgroundColor: Colors.white.withOpacity(0.7),
          title: Text(
            "Add Workout",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          actions: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              value: selectvalue,
              items: catagoryList.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                selectvalue = value;
              },
            ),

            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (selectvalue == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a category")),
                    );
                    return;
                  }

                  final addworkout = Usermodell(
                    id: DateTime.now().toString(),
                    catagary: selectvalue!,
                  );

                  await _userservices.addworkout(addworkout);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },

                child: Text("Add"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dailogbox();
        },
        child: Icon(Icons.add),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gym2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  '''Daily
 Workouts''',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ValueListenableBuilder<List<Usermodell>>(
                  valueListenable: _userservices.getnotifier,
                  builder: (context, fit, _) {
                    return ListView.builder(
                      itemCount: fit.length,
                      itemBuilder: (context, index) {
                        final workout = fit[index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Colors.black.withOpacity(0.3),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: ListTile(
                                leading: Icon(
                                  Icons.fitness_center,
                                  color: Colors.amberAccent,
                                ),
                                title: Text(
                                  workout.catagary,

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  workout.id,
                                  style: TextStyle(
                                    color: Colors.white.withRed(100),
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () {
                                  if (workout.catagary == "chest") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Chest(),
                                      ),
                                    );
                                  } else if (workout.catagary == "back") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Backday(),
                                      ),
                                    );
                                  } else if (workout.catagary == "leg") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LegDay(),
                                      ),
                                    );
                                  }
                                },
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        editdailog(index);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _userservices.deleteworkout(index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
