import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Testge"),
            onPressed: () {
              String date = "2022-11-26T15:04:58.975Z";
              DateTime ff = DateTime.parse(date);
              print(ff);
            },
          ),
        ),
      ),
    );
  }
}
