import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/viewer/custom_tile.dart';

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
        padding: const EdgeInsets.all(35),
        child: Column(
          children: _repositoryIot.iots
              .map(
                (iot) => Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 70,
                  child: Card(
                    child: CustomTile(
                      iot: iot,
                      isSelected: false,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
