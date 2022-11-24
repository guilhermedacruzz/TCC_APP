import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/controller/controller_iot.dart';
import 'package:tcc/services/service_iot.dart';
import 'package:tcc/widgets/listTile/custom_tile.dart';

import '../services/service_autentication.dart';

class CustomIotViewer extends StatefulWidget {
  const CustomIotViewer({super.key});

  @override
  State<CustomIotViewer> createState() => _CustomIotViewerState();
}

class _CustomIotViewerState extends State<CustomIotViewer> {
  late ControllerIot _controllerIot;

  @override
  void initState() {
    super.initState();

    final _autenticationService = Provider.of<ServiceAutentication>(context);

    final _serviceIot = Provider.of<ServiceIot>(context);

    _controllerIot = ControllerIot(_serviceIot);

    _controllerIot.getIots(_autenticationService.user!.id);
  }

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
            iot: _controllerIot.iots[0],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  for (var i = 0; i < 3; i++)
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.garage,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      title: Text(
                        "Portão da Frente",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: DefaultTextStyle(
                        style:
                            Theme.of(context).textTheme.bodyText2 as TextStyle,
                        child: Row(
                          children: const [
                            Text("Fechado"),
                            SizedBox(width: 20),
                            Text("12:00:00"),
                          ],
                        ),
                      ),
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
