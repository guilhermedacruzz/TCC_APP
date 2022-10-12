import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String item;
  final int index;

  const Slide({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            item,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.width * 0.40,
          ),
          Column(
            children: [
              Text("Não 1"),
              Text("Não 1"),
              Text("Não 1"),
            ],
          ),
        ],
      ),
    );
  }
}
