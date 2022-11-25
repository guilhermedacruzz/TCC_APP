import 'dart:collection';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:tcc/models/iot.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/services/service_autentication.dart';
import 'package:tcc/utils/enums.dart';

class RepositoryIot with ChangeNotifier {
  static const urlDominion = 'localhost:3000';
  static const getIotsEndPoint = "/iots";

  final List<Iot> _list = [];

  final ServiceAutentication _serviceAutentication;

  var _status = Status.idle;
  var _actionResult = ActionResult.none;
  var _statusData = DataStatus.empty;

  Status get status => _status;
  ActionResult get result => _actionResult;
  bool get hasData => _statusData == DataStatus.loaded;

  RepositoryIot(this._serviceAutentication);

  List<Iot> get iots {
    return UnmodifiableListView(_list);
  }

  Uri _getApiEndPoint() {
    return Uri.http(
      urlDominion,
      getIotsEndPoint,
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
          iots.add(
            Iot(
              id: data["_id"],
              name: data["name"],
              description: data["description"],
              user: data["user"],
              timer: data["timer"],
            ),
          );
        }

        return Result.value(iots);
        //return Result.value([Iot(id: "mdm,m3", name: "jdhqk", description: "efjej", timer: 4, user: "jdkjhdkjjh")]);
      } else {
        return Result.error(response.body);
      }
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  loadIots() async {
    final res = await _loadRemote();
    String? msg;

    if (res.isValue) {
      _list.clear();
      _list.addAll(res.asValue!.value);
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
