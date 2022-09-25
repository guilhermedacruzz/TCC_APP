import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc/forms/custom_button.dart';

import '../widgets/custom_drawler.dart';

class PageHome extends StatefulWidget {
  static String routeName = "/home";
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("SAPA"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
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
                  title: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.tiktok, color: Colors.white),
                    ),
                    title: const Text(
                      "Portão da Frente",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    subtitle: DefaultTextStyle(
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black45),
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nome do Portão: Portão da Frente"),
                          const Text("Estado atual do portão: Fechado"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 80,
                                child: CustomButton(
                                  widget: const Text(
                                    "Abrir",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  onAction: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title:
                          ChartTitle(text: 'Estado do Portão ao longo do dia'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_Infections, String>>[
                        LineSeries<_Infections, String>(
                          dataSource: <_Infections>[
                            _Infections('13:00', 0),
                            _Infections('14:00', 1),
                            _Infections('14:02', 1),
                            _Infections('18:56', 0),
                            _Infections('18:57', 1),
                            _Infections('22:00', 0)
                          ],
                          xValueMapper: (_Infections opened, _) => opened.hours,
                          yValueMapper: (_Infections opened, _) =>
                              opened.opened,
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
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
