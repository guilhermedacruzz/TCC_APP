import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tcc/models/iot.dart';
import 'package:tcc/repositories/repository_iot.dart';

class CustomIotTile extends StatelessWidget {
  final bool isSelected;
  final Iot iot;

  const CustomIotTile({
    super.key,
    required this.isSelected,
    required this.iot,
  });

  @override
  Widget build(BuildContext context) {
    final _repositoryIot = Provider.of<RepositoryIot>(context);

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (isSelected)
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.garage,
          color: Theme.of(context).backgroundColor,
        ),
      ),
      title: Text(
        iot.name,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2 as TextStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (isSelected)
              ? (_repositoryIot.hasLogs)
                  ? (_repositoryIot.logs.isNotEmpty)
                      ? [
                          Text(_repositoryIot.logs[0].status),
                          const SizedBox(width: 20),
                          Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(_repositoryIot.logs[0].date)),
                        ]
                      : [
                          const Icon(
                            Icons.block,
                          ),
                        ]
                  : [
                      const CircularProgressIndicator(),
                    ]
              : [
                  const Icon(
                    Icons.info,
                  ),
                ],
        ),
      ),
    );
  }
}
