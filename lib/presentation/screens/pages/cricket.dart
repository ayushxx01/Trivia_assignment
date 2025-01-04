import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/screens/widgets/my_button.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';

class CricketPage extends StatefulWidget {
  const CricketPage({super.key});

  @override
  _CricketPageState createState() => _CricketPageState();
}

class _CricketPageState extends State<CricketPage> {
  String? _selectedCricketer; // Variable to store the selected cricketer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Page'), // Title of the AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your favorite cricketer',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Radio button for selecting Sachin Tendulkar
            RadioListTile<String>(
              title: const Text('Sachin Tendulkar'),
              value: 'Sachin Tendulkar',
              groupValue: _selectedCricketer,
              onChanged: (value) {
                setState(() {
                  _selectedCricketer = value; // Update the selected cricketer
                });
              },
            ),
            // Radio button for selecting Virat Kohli
            RadioListTile<String>(
              title: const Text('Virat Kohli'),
              value: 'Virat Kohli',
              groupValue: _selectedCricketer,
              onChanged: (value) {
                setState(() {
                  _selectedCricketer = value; // Update the selected cricketer
                });
              },
            ),
            // Radio button for selecting MS Dhoni
            RadioListTile<String>(
              title: const Text('MS Dhoni'),
              value: 'MS Dhoni',
              groupValue: _selectedCricketer,
              onChanged: (value) {
                setState(() {
                  _selectedCricketer = value; // Update the selected cricketer
                });
              },
            ),
            // Custom button to proceed to the next page
            MyButton(
              onTap: () {
                if (_selectedCricketer != null) {
                  // Save the selected cricketer in the ResponseProvider
                  Provider.of<ResponseProvider>(context, listen: false)
                      .setCricket(_selectedCricketer!);
                  // Navigate to the FlagPage
                  Navigator.pushNamed(context, '/flag');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
