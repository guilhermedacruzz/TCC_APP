import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/widgets/home/appbar/custom_home_app_bar.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/appbar/custom_drawler.dart';
import 'package:tcc/widgets/home/viewer/custom_giant_button.dart';
import 'package:tcc/widgets/home/grafics/grafics_by_time_and_status.dart';
import 'package:tcc/widgets/home/viewer/custom_iot_viewer.dart';

class PageHome extends StatefulWidget {
  static String routeName = "/home";

  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  bool toggle = false;

  @override
  void initState() {
    super.initState();
    Provider.of<RepositoryIot>(context, listen: false).loadIots();
  }

  @override
  Widget build(BuildContext context) {
    final _repositoryIot = Provider.of<RepositoryIot>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _repositoryIot.hasData
                  ? (_repositoryIot.logs.isEmpty)
                      ? [
                          Text(
                            "Nenhum dispositivo vinculado!",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ]
                      : [
                          const CustomIotViewer(),
                          const SizedBox(height: 15),
                          const CustomGiantButton(),
                          Text(
                            _repositoryIot.currentIot.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(height: 15),
                          const GraficsByTimeAndStatus(),
                        ]
                  : [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 15),
                      Text(
                        "Carregando os seus dispositivos!",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
