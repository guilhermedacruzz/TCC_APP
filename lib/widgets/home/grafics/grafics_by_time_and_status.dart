import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc/widgets/home/grafics/grafics_object.dart';

class GraficsByTimeAndStatus extends StatelessWidget {
  const GraficsByTimeAndStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        StepLineSeries<GraficsObject, DateTime>(
          color: Theme.of(context).highlightColor,
            dataSource: [
              for (int i = 0; i < 20; i++)
                GraficsObject(DateTime.now().subtract(Duration(days: 370 * i)),
                    random.nextBool() ? 0 : 1),
            ],
            xValueMapper: (GraficsObject data, _) => data.x,
            yValueMapper: (GraficsObject data, _) => data.y)
      ],
    );
  }
}

