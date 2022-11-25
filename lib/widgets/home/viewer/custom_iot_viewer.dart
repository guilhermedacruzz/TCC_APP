import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/models/iot.dart';
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
    Size size = MediaQuery.of(context).size;

    return Card(
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: SizedBox(
            width: size.width * 0.75,
            height: 70,
            child: DropdownButton(
              isExpanded: true,
              value: _repositoryIot.iots[_repositoryIot.currentIot].id,
              items: _repositoryIot.iots
                  .map(
                    (type) => DropdownMenuItem(
                      value: type.id,
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomTile(
                          iot: type,
                          isSelected: false,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (type) {},
            ),
          ),
        ),
      ),
    );
  }
}
