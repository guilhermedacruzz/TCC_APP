import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/page_register_new_IOT.dart';
import 'package:tcc/pages/page_sign_up.dart';
import 'notifiers/dark_theme_provider.dart';
import 'pages/page_config.dart';
import 'pages/page_home.dart';
import 'pages/page_sign_in.dart';
import 'utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext contex, value, Widget? child) {
          return MaterialApp(
            title: "SAPA",
            debugShowCheckedModeBanner: false,
            initialRoute: PageSignIn.routeName,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            routes: {
              PageRegisterNewIOT.routeName: (context) => const PageRegisterNewIOT(),
              PageConfig.routeName: (context) => const PageConfig(),
              PageHome.routeName: (context) => const PageHome(),
              PageSignIn.routeName: (context) => const PageSignIn(),
              PageSignUp.routeName: (context) => const PageSignUp(),
            },
          );
        },
      ),
    );
  }
}
