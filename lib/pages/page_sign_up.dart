import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/page_splash.dart';
import 'package:tcc/pages/page_welcome.dart';
import '../controller/controller_sign_up.dart';
import '../forms/custom_button.dart';
import '../forms/custom_textformfield.dart';
import '../services/service_autentication.dart';
import 'page_sign_base.dart';

class PageSignUp extends StatefulWidget {
  static String routeName = "/signup";

  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> with TickerProviderStateMixin {
  bool hidePassword = true;
  late ControllerSignUp _controller;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = ControllerSignUp(
        Provider.of<ServiceAutentication>(context, listen: false));

    _controller.addListener(() {
      setState(() {});
    });
  }

  execute() async {
    if (_formKey.currentState!.validate()) {
      await _controller.signUp();

      if (_controller.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_controller.msg),
          backgroundColor: Theme.of(context).highlightColor,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageBase(
      title1: "VAMOS LÁ !",
      title2: "SERÁ RÁPIDO",
      subtitle: "Estavamos esperando por você, entre com as suas informações",
      footerText: "Já têm uma conta cadastrada?",
      footerButtonText: "Entre Agora",
      footerAction: () {
        Navigator.of(context).pushNamed(PageSplash.routeName);
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: "Username",
              hint: "Digite o seu username",
              validator: _controller.validateUsername,
              onChanged: (value) {
                _controller.setUsername(value ?? '');
              },
            ),
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
                  !hidePassword
                      ? Icons.remove_red_eye
                      : Icons.visibility_off,
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
            CustomTextFormField(
              label: 'Confirme sua senha',
              hint: 'Digite a sua senha',
              obscureText: true,
              validator: _controller.validateDifferentPassword,
              onChanged: (value) {
                _controller.setConfirmationPassword(value ?? '');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            _controller.processing
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: CustomButton(
                      widget: Text("Criar",
                          style: Theme.of(context).textTheme.button),
                      onAction: () {
                        execute();
                        Navigator.of(context).pushNamed(PageWelcome.routeName);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
