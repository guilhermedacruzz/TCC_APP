import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/notifiers/dark_theme_provider.dart';
import 'package:tcc/pages/autentication/login/page_recover_password.dart';
import 'package:tcc/pages/autentication/login/page_sign_in.dart';
import 'package:tcc/pages/autentication/login/page_sign_up.dart';
import 'package:tcc/pages/autentication/welcome/page_welcome.dart';
import 'package:tcc/pages/page_config.dart';
import 'package:tcc/pages/page_home.dart';
import 'package:tcc/pages/page_register_new_IOT.dart';
import 'package:tcc/pages/page_splash.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/style.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceAutentication(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext contex, value, Widget? child) {
          return MaterialApp(
            title: "SAPA",
            debugShowCheckedModeBanner: false,
            initialRoute: PageWelcome.routeName,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            routes: {
              PageRegisterNewIOT.routeName: (context) =>
                  const PageRegisterNewIOT(),
              PageConfig.routeName: (context) => const PageConfig(),
              PageHome.routeName: (context) => const PageHome(),
              PageSignIn.routeName: (context) => const PageSignIn(),
              PageSignUp.routeName: (context) => const PageSignUp(),
              PageRecoverPage.routeName: (context) => const PageRecoverPage(),
              PageSplash.routeName: (context) => const PageSplash(),
              PageWelcome.routeName: (context) => const PageWelcome(),
            },
          );
        },
      ),
    );
  }
}
