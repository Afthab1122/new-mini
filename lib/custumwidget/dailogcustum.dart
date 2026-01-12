import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onOk;
  final VoidCallback? onCancel;

  const CustomAlert({
    super.key,
    required this.title,
    required this.message, 
    required this.onOk,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(message),
      actions: [
        if (onCancel != null)
          TextButton(
            onPressed: onCancel,
            child: const Text("Cancel"),
          ),
        ElevatedButton(
          onPressed: onOk,
          child: const Text("OK"),
        ),
      ],
    );
  }
}
