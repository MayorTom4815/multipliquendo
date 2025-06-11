import 'package:flutter/material.dart';
import 'package:multipliquendo/big_card.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Random _rand = Random();
  int _num1 = 0;
  int _num2 = 0;
  int _trys = 0;
  int _res = 0;

  void _regenateNumbers() {
    setState(() {
      _num1 = _rand.nextInt(9);
      _num2 = _rand.nextInt(9);
      _res = (_num1 * _num2);
    });
  }

  void _opensnackbar(String title) {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    });
  }

  void compareRes(String value) {
    if (value == _res.toString()) {
      _opensnackbar("¡Correcto!");
      _regenateNumbers();
      setState(() {
        _trys = 0;
      });
    } else {
      _opensnackbar("Incorrecto...");
      setState(() {
        _trys++;
      });
    }
  }

  @override
  void initState() {
    _regenateNumbers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styletext = theme.textTheme.headlineLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_sharp, color: theme.colorScheme.onPrimary),
        title: Text(
          "Multipliquendo",
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),

      body: Container(
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Escribe la respuesta de:', style: styletext),
                SizedBox(height: 20),
                BigCard(num1: _num1, num2: _num2),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Intentos: $_trys",
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextField(
                  decoration: InputDecoration(
                    label: Text("Escribe tu respuesta..."),
                    filled: true,
                  ),

                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),

                  onSubmitted: (value) => compareRes(value),
                  textAlign: TextAlign.center,
                  maxLength: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
