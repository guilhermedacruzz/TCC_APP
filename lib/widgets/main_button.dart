import 'package:flutter/material.dart';
import 'package:tcc/widgets/app_text.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final Function press;

  const MainButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          onPressed: () => press(),
          color: color,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: AppText(text: text, color: textColor),
        ),
      ),
    );
  }
}
