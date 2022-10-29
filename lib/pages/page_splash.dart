import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/autentication/login/page_sign_in.dart';
import 'package:tcc/pages/page_home.dart';
import 'package:tcc/services/service_autentication.dart';
class PageSplash extends StatelessWidget {
  static const routeName = '/splash';

  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceAutentication = Provider.of<ServiceAutentication>(context);

    return serviceAutentication.logged ? const PageHome() : const PageSignIn();
  }
}