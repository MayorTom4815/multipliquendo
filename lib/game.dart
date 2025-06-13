import 'package:multipliquendo/big_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:multipliquendo/main_page.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.difficult});

  final DIFFICULTS difficult;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Random _rand = Random();
  int _score = 0;
  int _combo = 0;
  int _num1 = 0;
  int _num2 = 0;
  int _trys = 0;
  int _res = 0;

  void _exitGame(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MainPage())
    );
  }

  void _regenateNumbers() {
    setState(() {
      switch(widget.difficult){
        case DIFFICULTS.easy:
          _num1 = _rand.nextInt(10) + 1;
          _num2 = _rand.nextInt(10) + 1;
          break;

        case DIFFICULTS.normal:
          _num1 = _rand.nextInt(100) + 10;
          _num2 = _rand.nextInt(100) + 10;
          break;

        case DIFFICULTS.hard:
          _num1 = _rand.nextInt(100) + 1000;
          _num2 = _rand.nextInt(100) + 1000;
          break;

        }

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

  void _compareRes(String value) {
    if (value == _res.toString()) {
      _opensnackbar("¡Correcto!");
      _regenateNumbers();
      setState(() {
        _combo++;
        _trys = 0;
        _score += 10 * _combo;
      });
    } else {
      _opensnackbar("Incorrecto...");
      setState(() {
        _combo = 0;
        _trys++;
        
        _score = _score > 0 ? _score - 50 : 0;
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
        backgroundColor: theme.colorScheme.primary, 
        leading: Icon(
          Icons.close, 
          color: theme.colorScheme.onPrimary,
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.door_back_door, 
              color: theme.colorScheme.onPrimary,
            ),

            onPressed: () => _exitGame(), 
          ),
        ],

        title: Text(
          "Multipliquendo",
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Puntuaje: $_score",
                  style: TextStyle(
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,

              children: [
                Text('Escribe la respuesta de:', style: styletext),
                BigCard(num1: _num1, num2: _num2),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text(
                      "Intentos: $_trys",
                      style: TextStyle(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    Text(
                      "Combo: x$_combo",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),

                TextField(
                  decoration: InputDecoration(
                    label: Text("Escribe tu respuesta..."),
                    filled: true,
                  ),
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  onSubmitted: (value) => _compareRes(value),
                  textAlign: TextAlign.center,
                  autofocus: true,
                ),

                SizedBox(height: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
