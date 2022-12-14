import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/models/model_iot.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/viewer/custom_iot_tile.dart';

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

    Size size = MediaQuery.of(context).size;

    return Card(
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: SizedBox(
            width: double.infinity,
            height: 70,
            child: DropdownButton(
              isExpanded: true,
              value: _repositoryIot.currentIot,
              iconEnabledColor: Theme.of(context).highlightColor,
              items: _repositoryIot.iots
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomIotTile(
                          iot: type,
                          isSelected: type == _repositoryIot.currentIot,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (type) {
                setState(() {
                  _repositoryIot.setCurrentIot(type as Iot);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
