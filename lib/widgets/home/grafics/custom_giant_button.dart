import 'package:flutter/material.dart';

class CustomGiantButton extends StatelessWidget {
  const CustomGiantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        color: Theme.of(context).backgroundColor,
        iconSize: Theme.of(context).textTheme.headline1?.fontSize,
        onPressed: () {},
        icon: const Icon(
          Icons.power_settings_new,
        ),
      ),
    );
  }
}
