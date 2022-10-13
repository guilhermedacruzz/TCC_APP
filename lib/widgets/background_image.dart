import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundImage extends StatelessWidget {
  final Widget child;

  const BackgroundImage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: 40,
          left: (size.width / 2) - 240,
          child: Image.asset(
            "img/kjhkjklj.png",   
            fit: BoxFit.cover,
            width: size.width * 0.7,
          ),
        ),
        child,
      ],
    );
  }
}
