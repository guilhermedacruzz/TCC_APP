import 'package:flutter/material.dart';
import 'package:tcc/forms/custom_button.dart';
import 'package:tcc/forms/custom_textformfield.dart';

class PageLogin extends StatefulWidget {
  static String routeName = "/login";

  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool hidePassword = true;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.access_alarm,
                  size: Theme.of(context).textTheme.displayMedium!.fontSize,
                ),
              ],
            ),
            SizedBox(
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
                          "OLÁ !",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "BEM VINDO",
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
                    child: Column(children: [
                      const CustomTextFormField(
                        label: "Usuário, Email ou Telefone",
                        hint: "Digite o seu usuário",
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
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CheckboxListTile(
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
                          Text(
                            "Esqueceu sua senha?",
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: CustomButton(
                          widget: const Text(
                            "Entrar",
                          ),
                          onAction: () {},
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ainda não tem uma conta?",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(width: 25),
                Text(
                  "Criar Agora",
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
