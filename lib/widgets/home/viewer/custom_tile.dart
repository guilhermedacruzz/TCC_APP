import 'package:flutter/material.dart';
import 'package:tcc/models/iot.dart';

class CustomTile extends StatelessWidget {
  final bool isSelected;
  final Iot iot;

  const CustomTile({
    super.key,
    required this.isSelected,
    required this.iot,
  });

  @override
  Widget build(BuildContext context) {
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
          children: const [
            Text("Fechado"),
            SizedBox(width: 20),
            Text("12:00:00"),
          ],
        ),
      ),
    );
  }
}
