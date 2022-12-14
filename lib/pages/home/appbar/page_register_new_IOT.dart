import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/controllers/controller_register_new_iot.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/services/service_register_new_iot.dart';
import 'package:tcc/widgets/forms/custom_button.dart';
import 'package:tcc/widgets/forms/custom_textformfield.dart';

class PageRegisterNewIOT extends StatefulWidget {
  static String routeName = "/register";

  const PageRegisterNewIOT({super.key});

  @override
  State<PageRegisterNewIOT> createState() => _PageRegisterNewIOTState();
}

class _PageRegisterNewIOTState extends State<PageRegisterNewIOT> {
  late ControllerRegisterNewIot _controllerRegisterNewIot;
  late ServiceAutentication _autenticationService;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _autenticationService =
        Provider.of<ServiceAutentication>(context, listen: false);

    _controllerRegisterNewIot = ControllerRegisterNewIot(
        Provider.of<ServiceRegisterNewIot>(context, listen: false));

    _controllerRegisterNewIot.addListener(() {
      setState(() {});
    });
  }

  execute() async {
    if (_formKey.currentState!.validate()) {
      await _controllerRegisterNewIot.add(_autenticationService.user!.id);

      if (_controllerRegisterNewIot.hasMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_controllerRegisterNewIot.msg),
            backgroundColor: Theme.of(context).highlightColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Dispositivos"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
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
                  "Digite as informa????es solicitadas nos campos abaixo da maneira correta",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        label: "Nome",
                        hint: "Digite um nome para o aparelho",
                        validator: _controllerRegisterNewIot.validateName,
                        onChanged: (value) {
                          _controllerRegisterNewIot.setName(value ?? '');
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: CustomTextFormField(
                        label: "Temporizador [minutos]",
                        hint: "Digite o tempo do temporizador",
                        validator: _controllerRegisterNewIot.validateTimer,
                        onChanged: (value) {
                          _controllerRegisterNewIot
                              .setTimer(int.tryParse(value ?? "") ?? 0);
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  label: "Descri????o",
                  hint: "Digite uma descri????o para o aparelho",
                  validator: _controllerRegisterNewIot.validateDescription,
                  onChanged: (value) {
                    _controllerRegisterNewIot.setDescription(value ?? '');
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        label: "SSID",
                        hint: "Digite o nome da rede Wifi",
                        validator: _controllerRegisterNewIot.validateSSID,
                        onChanged: (value) {
                          _controllerRegisterNewIot.setSSID(value ?? '');
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: CustomTextFormField(
                        label: "Senha",
                        hint: "Digite a senha da rede Wifi",
                        validator: _controllerRegisterNewIot.validatePassword,
                        onChanged: (value) {
                          _controllerRegisterNewIot.setPassword(value ?? '');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                _controllerRegisterNewIot.processing
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: CustomButton(
                          widget: const Text(
                            "Conectar e Criar",
                          ),
                          onAction: () => execute(),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
