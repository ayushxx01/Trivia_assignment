import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responseProvider =
        Provider.of<ResponseProvider>(context); // Access the ResponseProvider

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'), // Title of the AppBar
      ),
      body: ListView.builder(
        itemCount:
            responseProvider.history.length, // Number of items in the history
        itemBuilder: (context, index) {
          final entry = responseProvider
              .history[index]; // Get the entry at the current index

          return Card(
            margin: const EdgeInsets.all(8.0), // Margin around the Card
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Game ${index + 1}: ${entry['timestamp']}'), // Display the game number and timestamp
                  Text('Name: ${entry['name']}'), // Display the name
                  Text(
                      'Cricket: ${entry['cricket']}'), // Display the cricket response
                  Text('Flag: ${entry['flag']}'), // Display the flag response
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
