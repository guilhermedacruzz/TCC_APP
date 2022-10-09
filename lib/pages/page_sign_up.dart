import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/controller_sign_up.dart';
import '../forms/custom_button.dart';
import '../forms/custom_textformfield.dart';
import '../services/service_autentication.dart';
import 'page_sign_base.dart';
import 'page_sign_in.dart';

class PageSignUp extends StatefulWidget {
  static String routeName = "/signup";

  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> with TickerProviderStateMixin {
  bool hidePassword = true;
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

    _controller.setRegister(true);
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
      title1: "VAMOS LÁ !",
      title2: "SERÁ RÁPIDO",
      subtitle: "Estavamos esperando por você, entre com as suas informações",
      footerText: "Já têm uma conta cadastrada?",
      footerButtonText: "Entre Agora",
      footerAction: () {
        _controller.setRegister(false);
        Navigator.of(context).pushNamed(PageSignIn.routeName);
      },
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VAMOS LÁ !",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "SERÁ RÁPIDO",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "Estavamos esperando por você, entre com as suas informações",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: "Usuário, Email ou Telefone",
                      hint: "Digite o seu usuário",
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
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
