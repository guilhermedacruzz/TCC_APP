import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tcc/models/model_iot.dart';
import 'package:async/async.dart';

class ServiceRegisterNewIot with ChangeNotifier {
  static const iotHost = "192.168.4.1";
  static const endPoint = "/hello";

  Uri _getIotEndPoint() {
    return Uri.http(iotHost, endPoint);
  }

  Future<Result<String>> _saveRemote(Iot iot) async {
    try {
      final body = json.encode(iot.toJson());
      final headers = {'Content-Type': 'application/json'};

      final resp = await http.post(
        _getIotEndPoint(),
        headers: headers,
        body: body,
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return Result.value(resp.body);
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
