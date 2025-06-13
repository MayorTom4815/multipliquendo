import 'package:flutter/material.dart';
import 'package:multipliquendo/game.dart';

enum DIFFICULTS { easy, normal, hard }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _startGame(DIFFICULTS diff){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GamePage(difficult: diff))
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var textNormal = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.primary,
    );

    var textButton = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    var textTitle = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold
    );

    var containersTheme = BoxDecoration(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        leading: Icon(Icons.close, color: theme.colorScheme.onPrimary),

        title: Text(
          "Multipliquendo",
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 10, color: Colors.black12),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                "Elige tu dificultad",
                style:  textTitle,
              ),

              Container(
                decoration: containersTheme,
                padding: EdgeInsets.all(30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,

                  children: [
                    Text("Multiplicaciones del 1 al 10", style: textNormal),
                    FilledButton(
                      child: Text("Facil", style: textButton),
                      onPressed: () => _startGame(DIFFICULTS.easy),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: containersTheme,
                padding: EdgeInsets.all(30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,

                  children: [
                    Text("Mutiplicaciones del 10 al 100", style: textNormal),
                    FilledButton(
                      child: Text("Normal", style: textButton),
                      onPressed: () => _startGame(DIFFICULTS.normal),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: containersTheme,
                padding: EdgeInsets.all(30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,

                  children: [
                    Text("Mutiplicaciones del 100 al 1000", style: textNormal),
                    FilledButton(
                      child: Text("Dificil", style: textButton),
                      onPressed: () => _startGame(DIFFICULTS.hard),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
