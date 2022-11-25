import 'package:flutter/material.dart';
import 'package:tcc/models/iot.dart';
import 'package:tcc/services/service_iot.dart';
import 'package:tcc/utils/enums.dart';

class ControllerIot with ChangeNotifier {
  Status _processing = Status.idle;

  final ServiceIot _serviceIot;

  List<Iot> get iots => _serviceIot.iots;

  ControllerIot(this._serviceIot);

  bool get processing => _processing == Status.working;

  bool get hasData => iots != [];

  getIots(String user_id) async {
    _processing = Status.working;
    notifyListeners();

    _serviceIot.getIots(user_id);

    _processing = Status.done;
    notifyListeners();
  } 

}