import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/viewer/custom_tile.dart';

class CustomIotViewer extends StatefulWidget {
  const CustomIotViewer({
    super.key,
  });

  @override
  State<CustomIotViewer> createState() => _CustomIotViewerState();
}

class _CustomIotViewerState extends State<CustomIotViewer> {
  @override
  Widget build(BuildContext context) {
    final _repositoryIot = Provider.of<RepositoryIot>(context);

    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Theme.of(context).highlightColor,
          collapsedIconColor: Theme.of(context).highlightColor,
          title: CustomTile(
            isSelected: true,
            iot: _repositoryIot.iots[_repositoryIot.currentIot],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  for (var i = 0; i < _repositoryIot.iots.length; i++)
                    if (i != _repositoryIot.currentIot)
                      GestureDetector(
                        child: CustomTile(
                          isSelected: false,
                          iot: _repositoryIot.iots[i],
                        ),
                        onTap: () {
                          _repositoryIot.setCurrentIot(i);
                          print(_repositoryIot.currentIot);
                        },
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
