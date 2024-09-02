import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria mouais',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 120, 2, 179)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'La pizzeria mouais'),
    );
  }
}
