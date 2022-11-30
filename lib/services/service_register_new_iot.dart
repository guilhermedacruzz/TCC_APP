import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tcc/models/model_iot.dart';
import 'package:async/async.dart';
import 'package:tcc/utils/enums/enum_action_result.dart';
import 'package:tcc/utils/enums/enum_data_status.dart';
import 'package:tcc/utils/enums/enum_status.dart';

class ServiceRegisterNewIot with ChangeNotifier {
  static const iotHost = "192.168.4.1";
  static const endPoint = "/hello";

  var _status = Status.idle;
  var _actionResult = ActionResult.none;
  var _statusData = DataStatus.empty;

  Uri _getIotEndPoint() {
    return Uri.http(iotHost, endPoint);
  }

  Future<Result<Iot>> _saveRemote(Iot iot) async {
    try {
      final resp = await http.post(
        _getIotEndPoint(),
        body: json.encode(iot.toJson()),
      );

      if (resp.statusCode == 200) {
        var data = json.decode(resp.body);
        return Result.value(data);
      } else {
        return Result.error(resp.statusCode);
      }
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<String?> add(Iot iot) async {
    _status = Status.working;
    notifyListeners();

    final result = await _saveRemote(iot);

    String? msg;
    if (result.isValue) {
      _actionResult = ActionResult.success;
    } else {
      _actionResult = ActionResult.error;
      msg = result.asError!.error as String;
    }

    _status = Status.done;
    notifyListeners();
    return msg;
  }
}
