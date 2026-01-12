import 'package:fitness/modules/fitness/view/model.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:hive_flutter/hive_flutter.dart';

class LibraryService {
  final Box<BookModel> box = Hive.box<BookModel>('books');

  void addBook(BookModel book) {
    box.add(book);
  }

  ValueListenable<Box<BookModel>> listenableBooks() {
    return box.listenable();
  }
}
