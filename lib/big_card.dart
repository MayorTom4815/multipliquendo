import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.num1, required this.num2});

  final int num1;
  final int num2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text("$num1 x $num2", style: style),
      ),
    );
  }
}
