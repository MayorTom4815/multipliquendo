import 'package:flutter/material.dart';

class MainTitle extends StatefulWidget {
  const MainTitle({
    super.key,
    required this.text
  });

  final String text;

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _tween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _tween = Tween<Offset>(begin: Offset(0, -3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut)
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    
    return SlideTransition(
      position: _tween,

      child: Container(
        alignment: Alignment.center,
        padding:  EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
      
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}