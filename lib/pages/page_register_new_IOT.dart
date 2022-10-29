import 'package:flutter/material.dart';
import 'package:tcc/forms/custom_button.dart';
import 'package:tcc/forms/custom_textformfield.dart';

class PageRegisterNewIOT extends StatelessWidget {
  static String routeName = "/register";

  const PageRegisterNewIOT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Dispositivos"),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cadastro de Dispositivos",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "Digite as informações solicitadas nos campos abaixo da maneira correta",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                label: "Nome",
                hint: "Digite um nome para o aparelho",
              ),
              const CustomTextFormField(
                label: "Descrição",
                hint: "Digite uma descrição para o aparelho",
              ),
              Row(
                children: const [
                  Flexible(
                    child: CustomTextFormField(
                      label: "SSID",
                      hint: "Digite o nome da rede Wifi",
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: CustomTextFormField(
                      label: "Senha",
                      hint: "Digite a senha da rede Wifi",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
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
            ],
          ),
        ),
      ),
    );
  }
}
