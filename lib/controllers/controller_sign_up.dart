import 'package:flutter/foundation.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/enums/enum_action_result.dart';
import 'package:tcc/utils/enums/enum_status.dart';

import 'package:validators/validators.dart';


class ControllerSignUp with ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmationPassword = '';
  Status _processing = Status.idle;
  ActionResult _result = ActionResult.none;
  String? _msg;

  final ServiceAutentication _serviceAutentication;

  ControllerSignUp(this._serviceAutentication);

  bool get processing => _processing == Status.working;
  bool get hasMsg => _result != ActionResult.none;
  String get msg => _msg ?? '';

  String get username => _username;
  String get email => _email;
  String get password => _password;

  String? validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return "O Username não pode ser vazio";
    }
    if (val.length < 8) {
      return "Username inválido";
    }
    return null;
  }

  String? validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return "E-mail não pode ser vazio";
    }
    if (!isEmail(val)) {
      return "E-mail inválido";
    }
    return null;
  }

  String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "A Password não pode ser vazia";
    }
    if (val.length < 6) {
      return "A Password deve ter mais de 5 digitos";
    }
    return null;
  }

  String? validateDifferentPassword(String? val) {
    if (_password != _confirmationPassword) {
      return "As Passwords não são iguais";
    }
    return null;
  }

  setUsername(String val) {
    _username = val;
  }

  setEmail(String val) {
    _email = val;
  }

  setPassword(String val) {
    _password = val;
  }

  setConfirmationPassword(String val) {
    _confirmationPassword = val;
  }

  Future<bool> signUp() async {
    bool status = false;
    _processing = Status.working;
    _msg = '';
    _result = ActionResult.none;
    notifyListeners();

    String? ret =
        await _serviceAutentication.singUp(_email, _password, _username);

    if (ret != null) {
      _msg = ret;
      _result = ActionResult.error;
    } else {
      _result = ActionResult.success;
      _msg = "Usuário Criado com Sucesso!";
      status = true;
    }

    _processing = Status.done;
    notifyListeners();
    return status;
  }

  Future<bool> singIn() async {
    bool status = false;
    _processing = Status.working;
    _msg = '';
    _result = ActionResult.none;
    notifyListeners();

    String? ret = await _serviceAutentication.singIn(_email, _password);

    if (ret != null) {
      _msg = ret;
      _result = ActionResult.error;
    } else {
      status = true;
    }

    _processing = Status.done;
    notifyListeners();
    return status;
  }

  Future<bool> update() async {
    bool status = false;
    _processing = Status.working;
    _msg = '';
    _result = ActionResult.none;
    notifyListeners();

    String? ret = await _serviceAutentication.update(email:email, password: password);

    if (ret != null) {
      _msg = ret;
      _result = ActionResult.error;
    } else {
      _msg = "Senha Alterada com sucesso!";
      _result = ActionResult.success;
      status = true;
    }

    _processing = Status.done;
    notifyListeners();
    return status;
  }
}
