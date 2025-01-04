import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/presentation/screens/pages/cricket.dart';
import 'package:trivia_app/presentation/screens/pages/flag.dart';
import 'package:trivia_app/presentation/screens/pages/history.dart';
import 'package:trivia_app/presentation/screens/pages/name.dart';
import 'package:trivia_app/presentation/screens/pages/summary.dart';
import 'package:trivia_app/presentation/provider/database_manager.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await Hive.initFlutter(); // Initialize Hive for Flutter
  await Hive.openBox('myBox'); // Open the Hive box named 'myBox'
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ResponseProvider()), // Provide the ResponseProvider
      ],
      child: const MyApp(), // Run the MyApp widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Title of the application
      debugShowCheckedModeBanner: false, // Disable the debug banner
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const NamePage(), // Route for the NamePage
        '/cricket': (context) =>
            const CricketPage(), // Route for the CricketPage
        '/flag': (context) => const FlagPage(), // Route for the FlagPage
        '/summary': (context) =>
            const SummaryPage(), // Route for the SummaryPage
        '/history': (context) =>
            const HistoryPage(), // Route for the HistoryPage
      },
    );
  }
}
