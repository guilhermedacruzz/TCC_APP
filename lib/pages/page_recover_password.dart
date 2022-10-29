import 'package:flutter/material.dart';
import 'package:tcc/pages/page_splash.dart';
import 'page_sign_up.dart';
import 'page_sign_base.dart';

class PageRecoverPage extends StatefulWidget {
  static String routeName = "/recoverpassword";

  const PageRecoverPage({super.key});

  @override
  State<PageRecoverPage> createState() => _PageRecoverPageState();
}

class _PageRecoverPageState extends State<PageRecoverPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return PageBase(
      type: PageRecoverPage.routeName,
      title1: "OH, NÃO!",
      title2: "EU ESQUECI",
      subtitle: "Entre com o seu email para definir a nova senha",
      hasName: false,
      hasEmail: true,
      hasPassword: true,
      hasConfirmPassword: true,
      centerButtonText: "Mudar",
      centerButtonAction: () {
        Navigator.of(context).pushNamed(PageSplash.routeName);
      },
      footerText: "Ainda não tem uma conta?",
      footerButtonText: "Criar Agora",
      footerAction: () {
        Navigator.of(context).pushNamed(PageSignUp.routeName);
      },
    );
  }
}
