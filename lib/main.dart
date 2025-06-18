import 'package:flutter/material.dart';
import 'package:multipliquendo/views/main_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final String title = "Multipliquendo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        useSystemColors: true,
      ),

      home: MainPage(),
    );
  }
}

void main() {
  runApp(const MainApp());
}
