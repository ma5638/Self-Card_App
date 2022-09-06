import 'package:flutter/material.dart';
import 'screens/quotesList.dart';
import 'screens/showQuotes.dart';
import 'screens/addQuote.dart';
import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Type Up Alarms',
      initialRoute: '/showQuotes',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const QuotesList(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/showQuotes': (context) => const ShowQuotes(),
        '/addQuote': (context) => const AddQuote(),
      },
    );
  }
}
