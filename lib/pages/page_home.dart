import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc/pages/page_register_new_IOT.dart';
import 'package:tcc/widgets/trash/grafics.dart';
import '../forms/custom_button.dart';
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
        title: const Text("SAPA"),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bem Vindo Diego!",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "Qualquer texto aqui",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor: Theme.of(context).expansionTileTheme.iconColor,
                  textColor: Theme.of(context).expansionTileTheme.textColor,
                  collapsedIconColor:
                      Theme.of(context).expansionTileTheme.collapsedIconColor,
                  collapsedTextColor:
                      Theme.of(context).expansionTileTheme.collapsedTextColor,
                  title: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.tiktok,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    title: Text(
                      "Portão da Frente",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyText2 as TextStyle,
                      child: Row(
                        children: const [
                          Text("Fechado"),
                          SizedBox(width: 20),
                          Text("12:00:00"),
                        ],
                      ),
                    ),
                  ),
                  children: const [
                    GraficsTeste(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Infections {
  _Infections(this.hours, this.opened);

  final String hours;
  final double opened;
}
