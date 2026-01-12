// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class BookModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  @HiveField(2)
  String imagePath;

  BookModel({
    required this.name,
    required this.category,
    required this.imagePath,
  });
}
