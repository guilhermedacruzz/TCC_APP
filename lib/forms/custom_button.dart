import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onAction;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (onAction != null)
          ? () {
              onAction!();
            }
          : null,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
