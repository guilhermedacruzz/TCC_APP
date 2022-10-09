import 'package:flutter/foundation.dart';
import 'package:validators/validators.dart';
import '../services/service_autentication.dart';
import '../utils/enums.dart';

class ControllerSignUp with ChangeNotifier {
  String _email = ''; // variavel que guarda o email
  String _password = ''; // variavel que guarda a senha
  String _confirmationPassword = ''; // variavel que guarda a senha da confirmação
  Status _processing = Status.idle;
  ActionResult _result = ActionResult.none;
  String? _errormsg;

  final ServiceAutentication
      _serviceAutentication; // Carrega o objeto de autenticação

  ControllerSignUp(this._serviceAutentication);

  // Gets
  bool get processing => _processing == Status.working;
  bool get hasError => _result == ActionResult.error;
  String get errorMsg => _errormsg ?? '';

  String get email => _email;
  String get password => _password;

  // Validação do email
  String? validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return "E-mail não pode ser vazio";
    }
    if (!isEmail(val)) {
      return "E-mail inválido";
    }
    return null;
  }

  // Validação da senha
  String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "A Password não pode ser vazia";
    }
    if (val.length < 6) {
      return "A Password deve ter mais de 5 digitos";
    }
    return null;
  }

  // Validação da senhd de confirmação
  String? validateDifferentPassword(String? val) {
    if (_password != _confirmationPassword) {
      return "As Passwords não são iguais";
    }
    return null;
  }

  // Setters
  setEmail(String val) {
    _email = val;
  }

  setPassword(String val) {
    _password = val;
  }

  setConfirmationPassword(String val) {
    _confirmationPassword = val;
  }

  ///Invoca um dos métodos do serviço de autenticação
  ///e processa o result.
  execute() async {
    _processing = Status.working;
    _errormsg = '';
    _result = ActionResult.none;
    notifyListeners();

    String? ret;
    ret = await _serviceAutentication.singUp(_email, _password);

    if (ret != null) {
      _errormsg = ret;
      _result = ActionResult.error;
    }

    _processing = Status.done;
    notifyListeners();
  }
}
