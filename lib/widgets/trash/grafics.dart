import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficsTeste extends StatelessWidget {
  const GraficsTeste({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    return SfCartesianChart(
      borderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(isVisible: false),
      // Chart title
      title: ChartTitle(text: 'Estado do Portão ao longo do dia'),
      // Enable legend
      legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<_Infections, String>>[
        LineSeries<_Infections, String>(
          dataSource: <_Infections>[
            for (var i = 0; i < 40; i++)
              _Infections(i, random.nextBool() ? "Fechado" : "Aberto"),
          ],
          xValueMapper: (_Infections opened, _) => opened.opened,
          yValueMapper: (_Infections opened, _) => opened.hours,
          // Enable data label
        ),
      ],
    );
  }
}

class _Infections {
  _Infections(this.hours, this.opened);

  final int hours;
  final String opened;
}
