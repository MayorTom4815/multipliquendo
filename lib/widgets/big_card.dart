import 'package:multipliquendo/globals.dart';
import 'package:flutter/material.dart';

class BigCard extends StatefulWidget {
  const BigCard({super.key, required this.num1, required this.num2});

  final int num1;
  final int num2;

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  Color _getColor() {
    switch (currentDifficult) {
      case DIFFICULTS.easy:
        return Colors.green.shade300;

      case DIFFICULTS.normal:
        return Colors.yellow.shade300;

      case DIFFICULTS.hard:
        return Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,

      children: [
        Text(
          "Escribe la respuesta de:",
          style: theme.textTheme.headlineLarge!.copyWith(color: Colors.black54),
        ),

        Card(
          color: _getColor(),
          elevation: 6,

          child: Padding(
            padding: EdgeInsets.all(20),

            child: Text(
              "${widget.num1} x ${widget.num2}",
              style: theme.textTheme.displayLarge!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),

              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
