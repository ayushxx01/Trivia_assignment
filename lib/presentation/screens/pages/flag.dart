import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/screens/widgets/my_button.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';

class FlagPage extends StatefulWidget {
  const FlagPage({super.key});

  @override
  _FlagPageState createState() => _FlagPageState();
}

class _FlagPageState extends State<FlagPage> {
  final Map<String, bool> _selectedColors = {
    'Red': false,
    'Green': false,
    'Blue': false,
    'Yellow': false,
  }; // Map to store the selected colors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Colors'), // Title of the AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select the colors of your country\'s flag',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Generate a list of CheckboxListTile widgets for each color
            ..._selectedColors.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: _selectedColors[key],
                onChanged: (bool? value) {
                  setState(() {
                    _selectedColors[key] = value!; // Update the selected color
                  });
                },
              );
            }).toList(),
            // Custom button to proceed to the next page
            MyButton(
              onTap: () {
                // Get the selected colors as a comma-separated string
                final selectedColors = _selectedColors.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .join(', ');
                // Save the selected colors in the ResponseProvider
                Provider.of<ResponseProvider>(context, listen: false)
                    .setFlag(selectedColors);
                // Navigate to the SummaryPage
                Navigator.pushNamed(context, '/summary');
              },
            ),
          ],
        ),
      ),
    );
  }
}
