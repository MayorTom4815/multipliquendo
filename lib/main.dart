import 'package:flutter/material.dart';
import 'package:multipliquendo/main_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final String title = "Multipliquendo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: MainPage(),
    );
  }
}

void main() {
  runApp(const MainApp());
}
