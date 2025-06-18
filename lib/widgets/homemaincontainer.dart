import 'package:flutter/material.dart';
import 'package:multipliquendo/globals.dart';
import 'package:multipliquendo/widgets/difficult_container.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetcontroller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _offsetcontroller = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SlideTransition(
      position: _offsetcontroller,

      child: Container(
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,

          children: [
            DifficultContainer(
              description: "Multiplicaciones del 1 al 10",
              titleButton: "Facíl",
              difficult: DIFFICULTS.easy,
            ),

            DifficultContainer(
              description: "Multiplicaciones del 10 al 100",
              titleButton: "Normal",
              difficult: DIFFICULTS.normal,
            ),

            DifficultContainer(
              description: "Multiplicaciones del 100 al 1000",
              titleButton: "Dificíl",
              difficult: DIFFICULTS.hard,
            ),
          ],
        ),
      ),
    );
  }
}
