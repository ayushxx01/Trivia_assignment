import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ResponseProvider with ChangeNotifier {
  final Box _box = Hive.box('myBox'); // Open the Hive box named 'myBox'

  // Getter to retrieve the history of responses from the Hive box
  List<Map<String, dynamic>> get history =>
      List<Map<String, dynamic>>.from((_box.get('history', defaultValue: [])
              as List) // Get the 'history' list from the box, default to an empty list if not found
          .asMap() // Convert the list to a map to get the index
          .entries // Get the entries of the map
          .map((entry) {
        // Map each entry to a new map with an 'index' key
        return {
          'index': entry.key + 1, // Add 1 to the index to make it 1-based
          ...Map<String, dynamic>.from(
              entry.value), // Spread the original map values
        };
      }));

  // Getter to retrieve the 'name' value from the Hive box, default to an empty string if not found
  String get name => _box.get('name', defaultValue: '');

  // Getter to retrieve the 'cricket' value from the Hive box, default to an empty string if not found
  String get cricket => _box.get('cricket', defaultValue: '');

  // Getter to retrieve the 'flag' value from the Hive box, default to an empty string if not found
  String get flag => _box.get('flag', defaultValue: '');

  // Method to set the 'name' value in the Hive box and notify listeners
  void setName(String value) {
    _box.put('name', value); // Save the 'name' value in the box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to set the 'cricket' value in the Hive box and notify listeners
  void setCricket(String value) {
    _box.put('cricket', value); // Save the 'cricket' value in the box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to set the 'flag' value in the Hive box and notify listeners
  void setFlag(String value) {
    _box.put('flag', value); // Save the 'flag' value in the box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to finalize the response by adding the current values to the history
  void finalizeResponse() {
    final timestamp =
        DateTime.now().toIso8601String(); // Get the current timestamp
    final newEntry = {
      'name': name, // Include the current 'name' value
      'cricket': cricket, // Include the current 'cricket' value
      'flag': flag, // Include the current 'flag' value
      'timestamp': timestamp, // Include the current timestamp
    };

    final updatedHistory = [
      ...history.map((e) => e
        ..remove(
            'index')), // Remove the 'index' key from each entry in the history
      newEntry // Add the new entry to the history
    ];
    _box.put('history', updatedHistory); // Save the updated history in the box
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to reset the 'name', 'cricket', and 'flag' values in the Hive box and notify listeners
  void resetFields() {
    _box.put('name', ''); // Reset the 'name' value to an empty string
    _box.put('cricket', ''); // Reset the 'cricket' value to an empty string
    _box.put('flag', ''); // Reset the 'flag' value to an empty string
    notifyListeners(); // Notify listeners to update the UI
  }
}
