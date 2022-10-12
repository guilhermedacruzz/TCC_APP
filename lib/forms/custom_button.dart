import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  final Function? onAction;

  const CustomButton({
    Key? key,
    required this.widget,
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
      child: widget,
    );
  }
}
