import 'package:flutter/material.dart';
import 'package:tcc/pages/autentication/login/page_base.dart';
import 'package:tcc/pages/autentication/login/page_recover_password.dart';
import 'package:tcc/pages/autentication/login/page_sign_up.dart';
import 'package:tcc/widgets/forms/custom_text_button.dart';

class PageSignIn extends StatefulWidget {
  static String routeName = "/signin";

  const PageSignIn({super.key});

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> with TickerProviderStateMixin {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return PageBase(
      type: PageSignIn.routeName,
      title1: "OLÁ !",
      title2: "BEM VINDO",
      subtitle: "Estavamos esperando por você, entre com as suas informações",
      hasName: false,
      hasEmail: true,
      hasPassword: true,
      hasConfirmPassword: false,
      extra: Row(
        children: [
          Flexible(
            child: CheckboxListTile(
              activeColor: Theme.of(context).indicatorColor,
              title: Text(
                "Lembrar-me",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          CustomTextButton(
            text: "Esqueceu sua senha?",
            onAction: () {
              Navigator.of(context).pushNamed(PageRecoverPage.routeName);
            },
          ),
        ],
      ),
      centerButtonText: "Entrar",
      centerButtonAction: () {},
      footerText: "Ainda não tem uma conta?",
      footerButtonText: "Criar Agora",
      footerAction: () {
        Navigator.of(context).pushNamed(PageSignUp.routeName);
      },
    );
  }
}
