import 'package:fitness/modules/fitness/auth/registermodel.dart';
import 'package:fitness/modules/fitness/view/ggg.dart';
import 'package:fitness/modules/fitness/view/usermodel/usermodell.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RegistermodelAdapter());
  Hive.registerAdapter(UsermodellAdapter());
  await Hive.openBox<Usermodell>("boxxy");
  await Hive.openBox<Registermodel>("boxy");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.  key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:Ggg());
  }
}

// import 'package:fitness/modules/fitness/view/homepage.dart';
// import 'package:fitness/modules/fitness/view/model.dart' show BookModel;
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(BookModelAdapter());
//   await Hive.openBox<BookModel>('books');

//   runApp(const MyApp());
// }

// class BookModelAdapter {
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
