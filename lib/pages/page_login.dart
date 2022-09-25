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
              children: const [
                Icon(
                  Icons.access_alarm,
                  size: 40,
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
                      children: const [
                        Text(
                          "OLÁ !",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: 55,
                          ),
                        ),
                        Text(
                          "BEM VINDO",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: 55,
                          ),
                        ),
                        Text(
                          "Estavamos esperando por você, entre com as suas informações",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                          ),
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
                          icon: Icon(!hidePassword
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
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
                              title: const Text(
                                "Lembrar-me",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                ),
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
                          const Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: CustomButton(
                          widget: const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
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
              children: const [
                Text(
                  "Ainda não tem uma conta?",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Criar Agora",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
