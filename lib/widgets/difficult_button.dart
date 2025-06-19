import 'package:multipliquendo/globals.dart';
import 'package:flutter/material.dart';

import 'package:multipliquendo/views/game.dart';

class DifficultButton extends StatefulWidget {
  const DifficultButton({
    super.key,
    required this.text,
    required this.difficult,
  });

  final DIFFICULT difficult;
  final String text;

  void startGame(BuildContext context) {
    currentDifficult = difficult;

    playSound(sfxDict["button_pressed"]!);
    transitionPager(context, GamePage());
  }

  @override
  State<DifficultButton> createState() => _DifficultButtonState();
}

class _DifficultButtonState extends State<DifficultButton> {


  Color _getDefaultColor() {
    switch (widget.difficult) {
      case DIFFICULT.easy:
        return Colors.green.shade300;

      case DIFFICULT.normal:
        return Colors.yellow.shade300;

      case DIFFICULT.hard:
        return Colors.red.shade300;
    }
  }

  Color _getHoveredColor() {
    switch (widget.difficult) {
      case DIFFICULT.easy:
        return Colors.green.shade400;

      case DIFFICULT.normal:
        return Colors.yellow.shade400;

      case DIFFICULT.hard:
        return Colors.red.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> state,
        ) {
          if (state.contains(WidgetState.hovered)) {
            return _getHoveredColor();
          }

          return _getDefaultColor();
        }),

        padding: WidgetStateProperty.resolveWith((state) {
          return EdgeInsets.all(20);
        }),

        shape: WidgetStateProperty.resolveWith((state) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          );
        }),
      ),

      onPressed: () => widget.startGame(context),
      onHover: (changed) => playSound(sfxDict["hovered_button"]),

      child: Text(
        widget.text,
        style: theme.textTheme.titleLarge!.copyWith(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
