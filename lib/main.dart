import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/autentication/login/page_recover_password.dart';
import 'package:tcc/pages/autentication/login/page_sign_in.dart';
import 'package:tcc/pages/autentication/login/page_sign_up.dart';
import 'package:tcc/pages/autentication/welcome/page_welcome.dart';
import 'package:tcc/pages/home/appbar/page_all_iots.dart';
import 'package:tcc/pages/home/appbar/page_config.dart';
import 'package:tcc/pages/home/page_home.dart';
import 'package:tcc/pages/home/appbar/page_register_new_iot.dart';
import 'package:tcc/pages/page_splash.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/services/service_register_new_iot.dart';
import 'package:tcc/utils/notifiers/provider_dark_theme.dart';
import 'package:tcc/utils/style/style_custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProviderDarkTheme providerDarkTheme = ProviderDarkTheme();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    providerDarkTheme.darkTheme =
        await providerDarkTheme.preferenceDarkTheme.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return providerDarkTheme;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceAutentication(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceRegisterNewIot(),
        ),
        ChangeNotifierProxyProvider<ServiceAutentication, RepositoryIot>(
          create: (context) => RepositoryIot(
              Provider.of<ServiceAutentication>(context, listen: false)),
          update: (context, serviceAutentication, last) => last!..update(serviceAutentication, last),
        ),
      ],
      child: Consumer<ProviderDarkTheme>(
        builder: (BuildContext contex, value, Widget? child) {
          return MaterialApp(
            title: "SAPA",
            debugShowCheckedModeBanner: false,
            initialRoute: PageSplash.routeName,
            theme: CustomTheme.themeData(providerDarkTheme.darkTheme, context),
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
              PageAllIots.routeName: (context) => const PageAllIots(),
            },
          );
        },
      ),
    );
  }
}
