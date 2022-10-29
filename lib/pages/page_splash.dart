import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/autentication/login/page_sign_in.dart';

import '../services/service_autentication.dart';
import 'page_home.dart';

///Tela da splash, que serve para definir se será
///mostrado a tela de login ou a tela home.
class PageSplash extends StatelessWidget {
  static const routeName = '/splash';

  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceAutentication = Provider.of<ServiceAutentication>(context);

    return serviceAutentication.logged ? const PageHome() : const PageSignIn();
  }
}