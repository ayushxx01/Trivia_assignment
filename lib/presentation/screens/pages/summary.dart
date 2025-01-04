import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';
import 'package:trivia_app/presentation/screens/widgets/my_button.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responseProvider =
        Provider.of<ResponseProvider>(context); // Access the ResponseProvider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary Page'), // Title of the AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the text horizontally
            children: [
              Text(
                'Name: ${responseProvider.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cricket: ${responseProvider.cricket}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Flag: ${responseProvider.flag}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Add some spacing before the button
              MyButton(
                onTap: () {
                  responseProvider
                      .finalizeResponse(); // Save the current submission
                  Navigator.pushNamed(
                      context, '/history'); // Navigate to History Page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
