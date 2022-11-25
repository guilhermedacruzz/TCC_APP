import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Container(
                      height: 80,
                      width: 400,
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.garage,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        title: Text(
                          "teste",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: DefaultTextStyle(
                          style: Theme.of(context).textTheme.bodyText2
                              as TextStyle,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Fechado"),
                              SizedBox(width: 20),
                              Text("12:00:00"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
