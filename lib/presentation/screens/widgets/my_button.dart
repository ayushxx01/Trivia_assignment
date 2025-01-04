import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap; // Callback function to handle button tap

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Trigger the callback function when the button is tapped
      child: Container(
        width: 200, // Set the width of the button
        height: 50, // Set the height of the button
        decoration: BoxDecoration(
          color: Colors.blue, // Set the background color of the button
          borderRadius: BorderRadius.circular(
              20), // Set the border radius for rounded corners
        ),
        child: Center(
          child: Text(
            'Submit', // Text displayed on the button
            style: TextStyle(
              color: Colors.white, // Set the text color to white
              fontSize: 20, // Set the font size of the text
            ),
          ),
        ),
      ),
    );
  }
}
