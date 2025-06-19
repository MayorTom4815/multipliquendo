import 'package:flutter/material.dart';
import 'package:multipliquendo/widgets/difficult_button.dart';

import 'package:multipliquendo/widgets/game_over_dialog.dart';
import 'package:multipliquendo/widgets/big_card.dart';
import 'package:multipliquendo/views/main_page.dart';
import 'package:multipliquendo/globals.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final MultiplicateHandle _comparator = MultiplicateHandle();
  int _score = 0;
  int _tries = 3;

  void _gameOver() {
    showDialog(
      context: context,
      builder: (context) => GameOverDialog(score: _score),
    );
  }

  void showSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black38,
        duration: Duration(seconds: 1),
        content: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _compareRes(String value) {
    int user = value.isNotEmpty ? int.parse(value) : 0;

    if (user == _comparator.res) {
      playSound(sfxDict["correct"]);
      showSnackBar("¡Correcto!");

      setState(() {
        _score += 10;
        _comparator.regenerateNumbers();
      });
    } else {
      playSound(sfxDict["error"]);
      showSnackBar("Incorrecto...");

      setState(() {
        _tries--;
      });
    }

    if (_tries == 0) {
      bestScore = user >= bestScore ? user : bestScore;
      _gameOver();
    }
  }

  Color _getBGColor() {
    switch (currentDifficult) {
      case DIFFICULT.easy:
        return Colors.green.shade100;

      case DIFFICULT.normal:
        return Colors.yellow.shade100;

      case DIFFICULT.hard:
        return Colors.red.shade100;
    }
  }

  @override
  void initState() {
    _comparator.regenerateNumbers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _getBGColor(),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,

          children: [
            ScoreContainer(score: _score, tries: _tries),

            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 40,

                children: [
                  BigCard(
                    num1: _comparator.numbers[0],
                    num2: _comparator.numbers[1],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,

                    children: [
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Escribe tu respuesta..."),
                          filled: true,
                        ),
                        style: theme.textTheme.headlineLarge!.copyWith(
                          color: Colors.black54,
                        ),
                        onSubmitted: (value) => _compareRes(value),
                        textAlign: TextAlign.center,
                        autofocus: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ExitButton(
              text: "Salir de la partida",
              difficult: currentDifficult,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}

class ExitButton extends DifficultButton {
  const ExitButton({
    super.key,
    required super.text,
    required super.difficult,
    required this.context,
  });

  final BuildContext context;

  @override
  void startGame(BuildContext context) {
    super.startGame(context);
    transitionPager(context, MainPage());
  }
}

class ScoreContainer extends StatelessWidget {
  const ScoreContainer({super.key, required this.score, required this.tries});

  final int tries;
  final int score;

  Color _getBGColor() {
    switch (currentDifficult) {
      case DIFFICULT.easy:
        return Colors.green.shade300;

      case DIFFICULT.normal:
        return Colors.yellow.shade300;

      case DIFFICULT.hard:
        return Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _getBGColor(),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Puntuación:", style: theme),
              Text("$score pts.", style: theme),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              for (var i = 0; i < tries; i++)
                Icon(Icons.cancel, color: Colors.black87),
            ],
          ),
        ],
      ),
    );
  }
}
