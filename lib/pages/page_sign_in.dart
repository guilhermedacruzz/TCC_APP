import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/page_recover_password.dart';
import 'package:tcc/widgets/custom_text_button.dart';
import '../controller/controller_sign_up.dart';
import '../forms/custom_button.dart';
import '../forms/custom_textformfield.dart';
import '../services/service_autentication.dart';
import 'page_sign_up.dart';
import 'page_sign_base.dart';

class PageSignIn extends StatefulWidget {
  static String routeName = "/signin";

  const PageSignIn({super.key});

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> with TickerProviderStateMixin {
  bool hidePassword = true;
  bool checkedValue = false;
  late ControllerSignUp _controller;

  //chave utilizada para identificar o form.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //inicialização do controlador
    _controller = ControllerSignUp(
        Provider.of<ServiceAutentication>(context, listen: false));

    //Para não precisar utilizar o AnimatedBuilder
    //é possível escutar as modificações do
    //controlador e atualizar o estado.
    _controller.addListener(() {
      setState(() {});
    });

    _controller.setRegister(false);
  }

  execute() async {
    if (_formKey.currentState!.validate()) {
      await _controller.execute();

      if (_controller.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_controller.errorMsg),
          backgroundColor: Theme.of(context).highlightColor,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageBase(
      title1: "OLÁ !",
      title2: "BEM VINDO",
      subtitle: "Estavamos esperando por você, entre com as suas informações",
      footerText: "Ainda não tem uma conta?",
      footerButtonText: "Criar Agora",
      footerAction: () {
        _controller.setRegister(true);
        Navigator.of(context).pushNamed(PageSignUp.routeName);
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: "Email",
              hint: "Digite o seu email",
              validator: _controller.validateEmail,
              onChanged: (value) {
                _controller.setEmail(value ?? '');
              },
            ),
            CustomTextFormField(
              label: 'Senha',
              hint: 'Digite a sua senha',
              suffixIcon: IconButton(
                icon: Icon(
                  !hidePassword ? Icons.remove_red_eye : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
              obscureText: hidePassword,
              validator: _controller.validatePassword,
              onChanged: (value) {
                _controller.setPassword(value ?? '');
              },
            ),
            Row(
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
            SizedBox(
              width: double.infinity,
              height: 45,
              child: CustomButton(
                widget: Text(
                  "Entrar",
                  style: Theme.of(context).textTheme.button,
                ),
                onAction: () {
                  execute();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
