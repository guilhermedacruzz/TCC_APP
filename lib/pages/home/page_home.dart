import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/widgets/home/appbar/custom_home_app_bar.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/widgets/home/appbar/custom_drawler.dart';
import 'package:tcc/widgets/home/grafics/grafics.dart';
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
      appBar: CustomHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _repositoryIot.hasData
                ? [
                    const CustomIotViewer(),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        color: Theme.of(context).backgroundColor,
                        iconSize:
                            Theme.of(context).textTheme.headline1?.fontSize,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.power_settings_new,
                        ),
                      ),
                    ),
                    Text(
                      _repositoryIot.currentIot.name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 15),
                    const GraficsTeste(),
                  ]
                : [
                    const CircularProgressIndicator(),
                    Text(
                      "Carregando.....",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
