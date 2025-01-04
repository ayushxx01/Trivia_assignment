import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/screens/widgets/my_button.dart';
import 'package:trivia_app/presentation/screens/widgets/my_text_field.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController _controller =
      TextEditingController(); // Controller to manage the text input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your name',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 10.0), // Space between the text and text field
            Padding(
              padding:
                  const EdgeInsets.all(16.0), // Padding around the text field
              child: MyTextField(
                controller:
                    _controller, // Attach the controller to the text field
              ),
            ),
            MyButton(
              onTap: () {
                // Save the entered name in the ResponseProvider
                Provider.of<ResponseProvider>(context, listen: false)
                    .setName(_controller.text);
                // Navigate to the CricketPage
                Navigator.pushNamed(context, '/cricket');
              },
            ),
          ],
        ),
      ),
    );
  }
}
