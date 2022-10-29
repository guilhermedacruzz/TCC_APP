import 'package:flutter/foundation.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/enums.dart';
import 'package:validators/validators.dart';


class ControllerSignUp with ChangeNotifier {
  String _username = '';
  Status _processing = Status.idle;
  ActionResult _result = ActionResult.none;
  String? _msg;

  final ServiceAutentication _serviceAutentication;

  ControllerSignUp(this._serviceAutentication);

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

}
