import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  bool? isResponsive;
  double? width;
  
  CustomButtonWithIcon({
    super.key,
    this.isResponsive = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).highlightColor,
      ),
      child: Image.asset(
        width: width,
        "img/arrow.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
