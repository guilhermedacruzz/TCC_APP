import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/controller/controller_config.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/widgets/dark_mode_switch.dart';
import 'package:tcc/widgets/forms/custom_textformfield.dart';

class PageConfig extends StatefulWidget {
  static String routeName = "/config";

  const PageConfig({super.key});

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  late ControllerConfig _controller;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = ControllerConfig(
        Provider.of<ServiceAutentication>(context, listen: false));

    _controller.addListener(() {
      setState(() {});
    });
  }

  execute() async {
    if (_formKey.currentState!.validate()) {
      await _controller.update();

      if (_controller.hasMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_controller.msg),
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
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mudar Temas",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SwitchDarkMode(),
              ],
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alterar Nome",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            label: "Novo nome",
                            hint: "Digite o seu novo nome",
                            validator: _controller.validateUsername,
                            onChanged: (value) {
                              _controller.setUsername(value ?? '');
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.restart_alt),
                          onPressed: () => execute(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
