import 'package:flutter/material.dart';
import 'package:tcc/widgets/dark_mode_switch.dart';

class PageConfig extends StatelessWidget {
  static String routeName = "/config";

  const PageConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mudar Temas",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SwitchDarkMode(),
            ],
          ),
        ]),
      ),
    );
  }
}
