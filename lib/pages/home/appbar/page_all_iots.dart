import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/viewer/custom_iot_tile.dart';

class PageAllIots extends StatelessWidget {
  static String routeName = "/allIots";
  const PageAllIots({super.key});

  @override
  Widget build(BuildContext context) {
    final _repositoryIot = Provider.of<RepositoryIot>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos os dispositivos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: _repositoryIot.iots
              .map(
                (iot) => Card(
                  child: ExpansionTile(
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    title: CustomIotTile(
                      iot: iot,
                      isSelected: false,
                    ),
                    children: [
                      Text("Nome: ${iot.name}"),
                      Text("Descrição: ${iot.description}"),
                      Text("Timer: ${iot.timer} minutos"),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
