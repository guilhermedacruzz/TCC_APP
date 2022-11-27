import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/grafics/grafics_converter.dart';
import 'package:tcc/widgets/home/grafics/grafics_object.dart';

class GraficsByTimeAndStatus extends StatelessWidget {
  static int MAX = 5;
  const GraficsByTimeAndStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final _repositoryIot = Provider.of<RepositoryIot>(context);

    return (_repositoryIot.hasLogs &&
            _repositoryIot.iots.isNotEmpty &&
            _repositoryIot.logs.length > 4)
        ? SfCartesianChart(
            primaryYAxis: CategoryAxis(
              axisLabelFormatter: (AxisLabelRenderDetails value) {
                return ChartAxisLabel(
                    GRAFICS_CONVERTER[int.parse(value.text)], value.textStyle);
              },
              isVisible: true,
              interval: 1,
              minimum: 0,
              maximum: MAX * 1.0,
            ),
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              StepLineSeries<GraficsObject, String>(
                  color: Theme.of(context).highlightColor,
                  dataSource: [
                    for (var i = 0; i < MAX; i++)
                      GraficsObject(
                        _repositoryIot.logs[i].date,
                        GRAFICS_CONVERTER
                            .indexOf(_repositoryIot.logs[i].status),
                      ),
                  ],
                  xValueMapper: (GraficsObject data, _) => data.x,
                  yValueMapper: (GraficsObject data, _) => data.y)
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 30),
              Text(
                "Sem dados para gerar o gráfico!",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
              ),
            ],
          );
  }
}
