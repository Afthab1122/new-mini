import 'dart:io';
import 'package:fitness/modules/fitness/view/addpage.dart' show AddScreen, BookCategory;
import 'package:fitness/modules/fitness/view/model.dart' show BookModel;
import 'package:fitness/modules/fitness/view/service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomeScreen extends StatelessWidget {
  final int initialTabIndex;

  HomeScreen({super.key, this.initialTabIndex = 0});

  final LibraryService service = LibraryService();

  @override
  Widget build(BuildContext context) {
    final categories = BookCategory.categories;

    return DefaultTabController(
      length: categories.length,
      initialIndex: initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Library"),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddScreen()),
            );
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: service.listenableBooks(),
          builder: (context, Box<BookModel> box, _) {
            final books = box.values.toList();

            return TabBarView(
              children: categories.map((category) {
                final filteredBooks = category == "All"
                    ? books
                    : books
                        .where((b) => b.category == category)
                        .toList();

                if (filteredBooks.isEmpty) {
                  return const Center(child: Text("No books"));
                }

                return ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (_, index) {
                    final book = filteredBooks[index];

                    return ListTile(
                      leading: book.imagePath.isNotEmpty
                          ? Image.file(
                              File(book.imagePath),
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.book),
                      title: Text(book.name),
                      subtitle: Text(book.category),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
