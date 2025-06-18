import 'package:flutter/material.dart';
import 'package:multipliquendo/globals.dart';
import 'package:multipliquendo/widgets/difficult_button.dart';

class DifficultContainer extends StatelessWidget{
  const DifficultContainer({super.key, required this.description, required this.titleButton, required this.difficult});

  final DIFFICULTS difficult;
  final String titleButton;
  final String description;

  Color _getColor(){
    switch(difficult) {
      case DIFFICULTS.easy:
        return Colors.green.shade100;

      case DIFFICULTS.normal:
        return Colors.yellow.shade100;

      case DIFFICULTS.hard:
        return Colors.red.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _getColor(),
        
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,

        children: [
          Text(
            description,
            textAlign: TextAlign.justify,
            style: theme.textTheme.headlineSmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold
            ),
          ),

          DifficultButton(text: titleButton, difficult: difficult)
        ],
      ),
    );
  }
}