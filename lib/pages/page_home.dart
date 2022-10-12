import 'package:flutter/material.dart';
import 'package:tcc/pages/page_register_new_IOT.dart';
import 'package:tcc/widgets/trash/grafics.dart';
import '../widgets/custom_drawler.dart';

class PageHome extends StatefulWidget {
  static String routeName = "/home";

  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    iconColor: Theme.of(context).highlightColor,
                    collapsedIconColor: Theme.of(context).highlightColor,
                    title: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.garage,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      title: Text(
                        "Portão da Frente",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: DefaultTextStyle(
                        style:
                            Theme.of(context).textTheme.bodyText2 as TextStyle,
                        child: Row(
                          children: const [
                            Text("Fechado"),
                            SizedBox(width: 20),
                            Text("12:00:00"),
                          ],
                        ),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            for (var i = 0; i < 3; i++)
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).highlightColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.garage,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                title: Text(
                                  "Portão da Frente",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                subtitle: DefaultTextStyle(
                                  style: Theme.of(context).textTheme.bodyText2
                                      as TextStyle,
                                  child: Row(
                                    children: const [
                                      Text("Fechado"),
                                      SizedBox(width: 20),
                                      Text("12:00:00"),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
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
              ),
              Text(
                "FECHADO",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 15),
              const GraficsTeste(),
            ],
          ),
        ),
      ),
    );
  }
}
