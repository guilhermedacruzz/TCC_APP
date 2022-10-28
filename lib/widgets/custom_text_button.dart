import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function onAction;
  TextStyle? textStyle;

  CustomTextButton({
    super.key,
    required this.text,
    required this.onAction,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onAction();
      },
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}

