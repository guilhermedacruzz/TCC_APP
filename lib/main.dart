import 'package:flutter/material.dart';
import 'pages/page_home.dart';
import 'pages/page_login.dart';
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
      initialRoute: PageHome.routeName,
      theme: Styles.themeData(false, context),
      routes: {
        PageHome.routeName: (context) => const PageHome(),
        PageLogin.routeName: (context) => const PageLogin(),
      },
    );
  }
}
