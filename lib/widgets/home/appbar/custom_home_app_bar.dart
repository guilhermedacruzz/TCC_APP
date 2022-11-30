import 'package:flutter/material.dart';
import 'package:tcc/pages/home/appbar/page_register_new_iot.dart';
import 'package:tcc/pages/page_splash.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

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
          onPressed: () {
            Navigator.of(context).pushNamed(PageSplash.routeName);
          },
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
