import 'package:flutter/material.dart';
import 'package:tcc/pages/autentication/login/page_base.dart';
import 'package:tcc/pages/page_splash.dart';
import 'package:tcc/pages/autentication/welcome/page_welcome.dart';

class PageSignUp extends StatefulWidget {
  static String routeName = "/signup";

  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return PageBase(
      type: PageSignUp.routeName,
      title1: "VAMOS LÁ !",
      title2: "SERÁ RÁPIDO",
      subtitle: "Estavamos esperando por você, entre com as suas informações",
      hasName: true,
      hasEmail: true,
      hasPassword: true,
      hasConfirmPassword: true,
      centerButtonText: "Criar",
      centerButtonAction: () {
        Navigator.of(context).pushNamed(PageWelcome.routeName);
      },
      footerText: "Já têm uma conta cadastrada?",
      footerButtonText: "Entre Agora",
      footerAction: () {
        Navigator.of(context).pushNamed(PageSplash.routeName);
      },
    );
  }
}
