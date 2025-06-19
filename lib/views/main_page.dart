import 'package:multipliquendo/widgets/homemaincontainer.dart';
import 'package:multipliquendo/widgets/title.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            MainTitle(text: "Elige tu dificultad:  "),
            MainContainer(),
          ],
        ),
      ),
    );
  }
}
