import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:tcc/forms/custom_button.dart';
import 'package:tcc/forms/custom_textformfield.dart';

import 'page_home.dart';
import 'page_sign_in.dart';

class PageSignUp extends StatefulWidget {
  static String routeName = "/signup";

  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> with TickerProviderStateMixin {
  bool hidePassword = true;

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
          child: SingleChildScrollView(
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
                            const CustomTextFormField(
                              label: 'Confirme sua senha',
                              hint: 'Digite a sua senha',
                            ),
                            const SizedBox(height: 30,),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: CustomButton(
                                widget: Text("Criar",
                                    style: Theme.of(context).textTheme.button),
                                onAction: () {
                                  Navigator.of(context)
                                      .pushNamed(PageHome.routeName);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já têm uma conta cadastrada?",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(width: 25),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(PageSignIn.routeName);
                      },
                      child: Text(
                        "Entre Agora",
                        style: Theme.of(context).textTheme.button?.merge(
                              TextStyle(
                                color: Theme.of(context).highlightColor,
                              ),
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
