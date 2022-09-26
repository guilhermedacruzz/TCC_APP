import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficsTeste extends StatelessWidget {
  const GraficsTeste({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        StepLineSeries<ChartData, DateTime>(
            dataSource: [
              for (int i = 0; i < 20; i++)
                ChartData(DateTime.now().subtract(Duration(days: 370 * i)),
                    random.nextBool() ? 0 : 1),
            ],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final DateTime x;
  final int y;
}
