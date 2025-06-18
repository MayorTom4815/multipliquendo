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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,

          children: [
            MainTitle(text: "Fin del juego..."),
            Text(
              "Tu mejor puntuaje: $bestScore",
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),

            Text(
              "Puanteje final: $score",
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,

              children: [
                TextButton(
                  onPressed: () => trasitionPager(context, MainPage()),

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  child: Text(
                    "Salir del juego",

                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                FilledButton.icon(
                  onPressed: () => trasitionPager(context, GamePage()),

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
