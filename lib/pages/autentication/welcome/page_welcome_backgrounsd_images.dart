import 'package:flutter/material.dart';

class PageWelcomeBackgroundImage extends StatelessWidget {
  final Widget child;
  final String src;

  const PageWelcomeBackgroundImage({
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
          bottom: 120,
          left: 30,
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
