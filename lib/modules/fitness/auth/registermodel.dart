import 'package:hive_flutter/adapters.dart';

part 'registermodel.g.dart';
@HiveType(typeId: 0)

class Registermodel {
@HiveField(0)
String id;
@HiveField(1)
String email;
@HiveField(2)
String password;
@HiveField(3)
String comformpass;
@HiveField(4)
String higtht;
@HiveField(5)
String weigth;
@HiveField(6)
String age;

Registermodel({
  required this.id,
  required this.email,
  required this.password,
  required this.comformpass,
  required this.higtht,
  required this.weigth,
  required this.age
});

}