import 'dart:collection';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:tcc/models/iot.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/models/logs.dart';
import 'package:tcc/repositories/repository_logs.dart';
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/defs/url_dominion.dart';
import 'package:tcc/utils/enums/enum_data_status.dart';

class RepositoryIot with ChangeNotifier {
  static const endPoint = "/iots/findByUserId";

  final List<Iot> _list = [];
  late Iot _currentIot;

  final ServiceAutentication _serviceAutentication;
  late RepositoryLogs _repositoryLogs;

  var _statusData = DataStatus.empty;
  bool get hasData => _statusData == DataStatus.loaded;
  bool get hasLogs => _repositoryLogs.hasData;

  Iot get currentIot => _currentIot;

  void setCurrentIot(Iot newIot) async {
    _currentIot = newIot;
    await _repositoryLogs.loadLogs();
    notifyListeners();
  }

  List<Iot> get iots {
    return UnmodifiableListView(_list);
  }

  List<Logs> get logs {
    return UnmodifiableListView(_repositoryLogs.logs);
  }

  RepositoryIot(this._serviceAutentication) {
    _repositoryLogs = RepositoryLogs(this);
  }

  Uri _getApiEndPoint() {
    return Uri.http(
      URL_DOMINION,
      endPoint,
      {
        'id': _serviceAutentication.user?.id,
      },
    );
  }

  Future<Result<List<Iot>>> _loadRemote() async {
    try {
      final response = await http.get(_getApiEndPoint());

      if (response.statusCode == 200) {
        final list = json.decode(response.body) as List;
        final iots = <Iot>[];

        for (var i = 0; i < list.length; i++) {
          final data = list[i];
          iots.add(Iot.fromJson(data));
        }

        return Result.value(iots);
      } else {
        return Result.error(response.body);
      }
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  loadIots() async {
    _statusData = DataStatus.empty;
    final res = await _loadRemote();

    if (res.isValue) {
      _list.clear();
      _list.addAll(res.asValue!.value);
      if(_list.isNotEmpty) {
        setCurrentIot(_list[0]);
      }
      _statusData = DataStatus.loaded;
    }

    notifyListeners();
  }
}
