import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:tcc/models/model_logs.dart';
import 'package:tcc/repositories/repository_iot.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/utils/defs/def_url_dominion.dart';
import 'package:tcc/utils/enums/enum_data_status.dart';

class RepositoryLogs with ChangeNotifier {
  static const endPoint = "/logs/findByIotId";

  final List<Logs> _list = [];
  final RepositoryIot _repositoryIot;

  var _statusData = DataStatus.empty;
  bool get hasData => _statusData == DataStatus.loaded;

  List<Logs> get logs {
    return UnmodifiableListView(_list);
  }

  RepositoryLogs(this._repositoryIot);

  Uri _getApiEndPoint() {
    return Uri.http(
      URL_DOMINION,
      endPoint,
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
          logs.add(Logs.fromJson(data));
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

    if (res.isValue) {
      _list.clear();
      _list.addAll(res.asValue!.value.reversed);
      _statusData = DataStatus.loaded;
    } 

    notifyListeners();
  }
}
