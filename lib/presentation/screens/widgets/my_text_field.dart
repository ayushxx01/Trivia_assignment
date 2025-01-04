import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller; // Controller to manage the text input

  const MyTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Attach the controller to the text field
      decoration: InputDecoration(
        border: OutlineInputBorder(), // Set the border style of the text field
        labelText: 'Enter your name', // Set the label text of the text field
      ),
    );
  }
}
