import 'package:fitness/modules/fitness/view/homepage.dart' show HomeScreen;
import 'package:fitness/modules/fitness/view/model.dart' show BookModel;
import 'package:fitness/modules/fitness/view/service.dart' show LibraryService;
import 'package:flutter/material.dart';



class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  String? selectedCategory;
  final LibraryService service = LibraryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Book")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Book Name"),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Category"),
              items: BookCategory.categories
                  .where((e) => e != "All")
                  .map(
                    (cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selectedCategory = value;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: "Image Path"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    // ignore: curly_braces_in_flow_control_structures
                    selectedCategory == null) return;

                service.addBook(
                  BookModel(
                    name: _nameController.text,
                    category: selectedCategory!,
                    imagePath: _imageController.text,
                  ),
                );

                // 🔑 Navigate to selected category tab
                final index = BookCategory.categories
                    .indexOf(selectedCategory!);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        HomeScreen(initialTabIndex: index),
                  ),
                );
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCategory {
  static const List<String> categories = [
    "All",
    "Fiction",
    "Nonfiction",
    "Education",
  ];
}
