import 'package:flutter/material.dart';

import '../pages/page_config.dart';
import '../pages/page_login.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late AssetImage image;
  final String gif = "assets/images/anime.gif";

  @override
  void initState() {
    super.initState();
    image = AssetImage(gif);
  }

  @override
  void dispose() {
    image.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(180)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(180),
                child: Image(
                  image: image,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Diego Teixeira",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "diegoteixeira@yahoo.com.br",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Divider(height: 30),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            const ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text("Meus dispositivos"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configurações"),
              onTap: () {
                Navigator.of(context).pushNamed(PageConfig.routeName);
              },
            ),
            const Divider(height: 30),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                Navigator.of(context).pushNamed(PageLogin.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
