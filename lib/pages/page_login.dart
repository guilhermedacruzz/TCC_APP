import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:tcc/forms/custom_button.dart';
import 'package:tcc/forms/custom_textformfield.dart';

import 'page_home.dart';

class PageLogin extends StatefulWidget {
  static String routeName = "/login";

  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> with TickerProviderStateMixin {
  bool hidePassword = true;
  bool checkedValue = false;

  ParticleOptions particleOptions = const ParticleOptions(
    baseColor: Colors.grey,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 15.0,
    spawnMaxSpeed: 30.0,
    spawnMinRadius: 15.0,
    spawnMaxRadius: 35.0,
    particleCount: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(options: particleOptions),
        vsync: this,
        child: Container(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/sapo.png",
                    height: 80,
                    fit: BoxFit.cover,
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
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                            widget: Text("Entrar",
                                style: Theme.of(context).textTheme.button),
                            onAction: () {
                              Navigator.of(context)
                                  .pushNamed(PageHome.routeName);
                            },
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
                    style: Theme.of(context).textTheme.button?.merge(
                          TextStyle(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
