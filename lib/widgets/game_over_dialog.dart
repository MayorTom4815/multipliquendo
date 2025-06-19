import 'package:flutter/material.dart';

import 'package:multipliquendo/views/main_page.dart';
import 'package:multipliquendo/widgets/title.dart';
import 'package:multipliquendo/views/game.dart';
import 'package:multipliquendo/globals.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.black26,

      child: Container(
        color: theme.colorScheme.primaryContainer,
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 30,

          children: [
            MainTitle(text: "Fin del juego..."),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,

              children: [
                Text(
                  "Tu mejor puntuación: $bestScore pts.",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Puntuación final: $score pts.",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 5,

              children: [
                TextButton.icon(
                  onPressed: () => transitionPager(context, MainPage()),

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  icon: Icon(Icons.door_back_door),
                  
                  label: Text(
                    "Salir del juego",

                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                FilledButton.icon(
                  onPressed: () => transitionPager(context, GamePage()),

                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    iconColor: theme.colorScheme.onPrimary,
                    padding: EdgeInsets.all(20),
                  ),

                  icon: Icon(Icons.rotate_90_degrees_ccw),

                  label: Text(
                    "Volver a intentar",

                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
