import 'package:flutter/material.dart';
import 'pages/pages_login.dart';
import 'utils.dart/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SAPA",
      debugShowCheckedModeBanner: false,
      initialRoute: PageLogin.routeName,
      theme: Styles.themeData(false, context),
      routes: {
        PageLogin.routeName: (context) => const PageLogin(),
      },
    );
  }
}
