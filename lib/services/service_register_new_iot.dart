import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tcc/models/model_iot.dart';
import 'package:async/async.dart';
import 'package:tcc/utils/enums/enum_action_result.dart';
import 'package:tcc/utils/enums/enum_data_status.dart';
import 'package:tcc/utils/enums/enum_status.dart';

class ServiceRegisterNewIot with ChangeNotifier {
  static const iotHost = "localhost:3000";
  static const endPoint = "/iots/create";

  Uri _getIotEndPoint() {
    return Uri.http(iotHost, endPoint);
  }

  Future<Result<Iot>> _saveRemote(Iot iot) async {
    try {
      final body = json.encode(iot.toJson());
      final headers = {'Content-Type': 'application/json'};

      final resp = await http.post(
        _getIotEndPoint(),
        headers: headers,
        body: body,
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        var data = json.decode(resp.body);
        return Result.value(Iot.fromJson(data));
      } else {
        return Result.error(json.decode(resp.body)["error"]);
      }
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<String?> add(Iot iot) async {
    notifyListeners();

    final result = await _saveRemote(iot);

    String? msg;
    if (!result.isValue) {
      msg = result.asError!.error as String;
    }

    notifyListeners();
    return msg;
  }
}
