import 'package:hive_flutter/hive_flutter.dart';

part 'usermodell.g.dart';
@HiveType(typeId: 1)
class Usermodell {
@HiveField(0)
String id;
@HiveField(1)
String catagary;

Usermodell({
  required this.id,
  required this.catagary
});

}