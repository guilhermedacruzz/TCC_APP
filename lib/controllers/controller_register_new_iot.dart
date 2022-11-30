import 'package:flutter/material.dart';
import 'package:tcc/models/model_iot.dart';
import 'package:tcc/services/service_register_new_iot.dart';
import 'package:tcc/utils/enums/enum_action_result.dart';
import 'package:tcc/utils/enums/enum_status.dart';

class ControllerRegisterNewIot with ChangeNotifier {
  String _name = '';
  String _description = '';
  int _timer = 5;
  String _ssid = '';
  String _password = '';

  final ServiceRegisterNewIot _serviceRegisterNewIot;

  ControllerRegisterNewIot(this._serviceRegisterNewIot);

  Status _status = Status.idle;
  ActionResult _result = ActionResult.none;
  String? _msg;

  bool get hasMsg => _result != ActionResult.none;
  String get msg => _msg ?? '';

  String get name => _name;
  String get description => _description;
  int get timer => _timer;
  String get ssid => _ssid;
  String get password => _password;

  setName(String val) {
    _name = val;
  }

  setDescription(String val) {
    _description = val;
  }

  setTimer(int val) {
    _timer = val;
  }

  setSSID(String val) {
    _ssid = val;
  }

  setPassword(String val) {
    _password = val;
  }

  String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return "O Nome não pode ser vazio";
    }
    if (val.length < 6) {
      return "Nome inválido";
    }
    return null;
  }

  String? validateDescription(String? val) {
    if (val == null || val.isEmpty) {
      return "A descrição não pode ser vazia";
    }
    if (val.length < 12) {
      return "Descrição inválida";
    }
    return null;
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  String? validateTimer(String? val) {
    if (val == null || val.isEmpty) {
      return "O temporizador não pode ser vazio";
    }
    if (!isNumeric(val)) {
      return "Temporizador inválido";
    }
    return null;
  }

  String? validateSSID(String? val) {
    if (val == null || val.isEmpty) {
      return "O SSID não pode ser vazio";
    }
    if (val.length < 8) {
      return "SSID inválido";
    }
    return null;
  }

  String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "A senha não pode ser vazia";
    }
    if (val.length < 8) {
      return "Senha inválida";
    }
    return null;
  }

  Future<String?> add(String user_id) async {
    _status = Status.working;
    notifyListeners();

    Iot iot = Iot(
      id: '',
      name: name,
      description: description,
      user: user_id,
      timer: timer,
      ssid: ssid,
      password: password,
    );

    final resp = await _serviceRegisterNewIot.add(iot);

    _status = Status.done;
    notifyListeners();

    return resp;
  }
}
