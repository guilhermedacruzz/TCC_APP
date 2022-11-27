import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:intl/intl.dart';
import 'package:tcc/models/logs.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/utils/enums/enums.dart';

class RepositoryLogs with ChangeNotifier {
  static const urlDominion = '192.168.100.110:3000';
  static const getLogsEndPoint = "/logs/findByIotId";

  final List<Logs> _list = [];

  final RepositoryIot _repositoryIot;

  var _status = Status.idle;
  var _actionResult = ActionResult.none;
  var _statusData = DataStatus.empty;

  Status get status => _status;
  ActionResult get result => _actionResult;
  bool get hasData => _statusData == DataStatus.loaded;

  RepositoryLogs(this._repositoryIot);

  List<Logs> get logs {
    return UnmodifiableListView(_list);
  }

  Uri _getApiEndPoint() {
    return Uri.http(
      urlDominion,
      getLogsEndPoint,
      {
        'id': _repositoryIot.currentIot.id,
      },
    );
  }

  Future<Result<List<Logs>>> _loadRemote() async {
    try {
      final response = await http.get(_getApiEndPoint());

      if (response.statusCode == 200) {
        final list = json.decode(response.body) as List;
        final logs = <Logs>[];

        for (var i = 0; i < list.length; i++) {
          final data = list[i];
          logs.add(
            Logs(
              id: data["_id"],
              iot: data["iot"],
              minutes: data["minutes"],
              status: data["status"],
              date: DateFormat("yyyy-MM-dd hh:mm").parse(DateTime.now().toString()),//DateFormat("yyyy-MM-dd hh:mm").parse(data["date"]),
            ),
          );
        }

        return Result.value(logs);
      } else {
        return Result.error(response.body);
      }
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  loadLogs() async {
    final res = await _loadRemote();
    String? msg;

    if (res.isValue) {
      _list.clear();
      _list.addAll(res.asValue!.value.reversed);
      _actionResult = ActionResult.success;
      _statusData = DataStatus.loaded;
    } else {
      msg = res.asError!.error as String;
      _actionResult = ActionResult.error;
    }

    _status = Status.done;
    notifyListeners();
  }
}
