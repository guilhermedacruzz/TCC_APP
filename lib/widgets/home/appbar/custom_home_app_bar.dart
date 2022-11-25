import 'package:flutter/material.dart';
import 'package:tcc/pages/home/appbar/page_register_new_IOT.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sapo.png",
              height: 80,
              fit: BoxFit.cover,
            ),
            Text(
              "SAPA",
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(PageRegisterNewIOT.routeName);
          },
        ),
      ],
    );
  }
}