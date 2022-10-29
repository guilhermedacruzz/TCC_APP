import 'package:flutter/material.dart';

class WelcomeBackgroundImage extends StatelessWidget {
  final Widget child;
  final String src;

  const WelcomeBackgroundImage({
    super.key,
    required this.child,
    required this.src,
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
            src,   
            fit: BoxFit.cover,
            width: size.width * 0.7,
          ),
        ),
        child,
      ],
    );
  }
}
