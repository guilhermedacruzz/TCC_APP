import 'package:flutter/material.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/enums/enums.dart';

class ControllerConfig with ChangeNotifier {
  String _username = '';
  Status _processing = Status.idle;
  ActionResult _result = ActionResult.none;
  String? _msg;

  final ServiceAutentication _serviceAutentication;

  ControllerConfig(this._serviceAutentication);

  bool get processing => _processing == Status.working;
  bool get hasMsg => _result != ActionResult.none;
  String get msg => _msg ?? '';

  String get username => _username;

  String? validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return "O Username não pode ser vazio";
    }
    if (val.length < 8) {
      return "Username inválido";
    }
    return null;
  }

  setUsername(String val) {
    _username = val;
  }

  update() async {
    _processing = Status.working;
    _msg = '';
    _result = ActionResult.none;
    notifyListeners();

    String? ret = await _serviceAutentication.update(
        email: _serviceAutentication.user!.email, name: _username);

    if (ret != null) {
      _msg = ret;
      _result = ActionResult.error;
    } else {
      _msg = "Nome Alterado com sucesso!";
      _result = ActionResult.success;
    }

    _processing = Status.done;
    notifyListeners();
  }
}
