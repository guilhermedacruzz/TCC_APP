import 'package:flutter/material.dart';
import 'package:tcc/models/iot.dart';
import 'package:tcc/widgets/home/viewer/custom_tile.dart';

class CustomIotViewer extends StatelessWidget {
  final List<Iot> iots;
  int currrentIot;

  CustomIotViewer({
    super.key,
    required this.iots,
    this.currrentIot = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Theme.of(context).highlightColor,
          collapsedIconColor: Theme.of(context).highlightColor,
          title: CustomTile(
            isSelected: true,
            iot: iots[currrentIot],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  for (var i = 0; i < 3; i++)
                    CustomTile(
                      isSelected: false,
                      iot: iots[i],
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
