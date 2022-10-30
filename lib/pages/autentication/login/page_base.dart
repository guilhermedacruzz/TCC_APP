import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/controller/controller_sign_up.dart';
import 'package:tcc/pages/autentication/login/page_recover_password.dart';
import 'package:tcc/pages/autentication/login/page_sign_in.dart';
import 'package:tcc/pages/autentication/login/page_sign_up.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/widgets/custom_text_button.dart';
import 'package:tcc/widgets/forms/custom_button.dart';
import 'package:tcc/widgets/forms/custom_textformfield.dart';

class PageBase extends StatefulWidget {
  final String type;
  final String title1;
  final String title2;
  final String subtitle;
  final bool hasName;
  final bool hasEmail;
  final bool hasPassword;
  final bool hasConfirmPassword;
  final Widget? extra;
  final String centerButtonText;
  final Function centerButtonAction;
  final String footerText;
  final Function footerAction;
  final String footerButtonText;

  const PageBase({
    super.key,
    required this.type,
    required this.title1,
    required this.title2,
    required this.subtitle,
    this.hasName = false,
    this.hasEmail = false,
    this.hasPassword = false,
    this.hasConfirmPassword = false,
    this.extra,
    required this.centerButtonText,
    required this.centerButtonAction,
    required this.footerText,
    required this.footerAction,
    required this.footerButtonText,
  });

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> with TickerProviderStateMixin {
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
      bool status = false;

      if (widget.type == PageSignIn.routeName) {
        status = await _controller.singIn();
      } else if (widget.type == PageSignUp.routeName) {
        status = await _controller.signUp();
      } else if (widget.type == PageRecoverPage.routeName) {
        status = await _controller.update();
      }

      if (_controller.hasMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_controller.msg),
            backgroundColor: Theme.of(context).highlightColor,
          ),
        );
      }

      if (status) {
        widget.centerButtonAction();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
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
          ),
        ),
        vsync: this,
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints viewportConstraints,
          ) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title1,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            widget.title2,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            widget.subtitle,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (widget.hasName)
                            CustomTextFormField(
                              label: "Username",
                              hint: "Digite o seu username",
                              validator: _controller.validateUsername,
                              onChanged: (value) {
                                _controller.setUsername(value ?? '');
                              },
                            ),
                          if (widget.hasEmail)
                            CustomTextFormField(
                              label: "Email",
                              hint: "Digite o seu email",
                              validator: _controller.validateEmail,
                              onChanged: (value) {
                                _controller.setEmail(value ?? '');
                              },
                            ),
                          if (widget.hasPassword)
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
                          if (widget.hasConfirmPassword)
                            CustomTextFormField(
                              label: 'Confirme sua senha',
                              hint: 'Digite a sua senha',
                              obscureText: true,
                              validator:
                                  _controller.validateDifferentPassword,
                              onChanged: (value) => _controller
                                  .setConfirmationPassword(value ?? ''),
                            ),
                          widget.extra ?? const SizedBox(height: 20),
                          _controller.processing
                              ? const CircularProgressIndicator()
                              : SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: CustomButton(
                                    widget: Text(
                                      widget.centerButtonText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .button,
                                    ),
                                    onAction: () => execute(),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.footerText,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        CustomTextButton(
                          text: widget.footerButtonText,
                          onAction: widget.footerAction,
                          textStyle: Theme.of(context).textTheme.button?.merge(
                                TextStyle(
                                  color: Theme.of(context).highlightColor,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
