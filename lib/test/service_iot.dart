import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/models/iot.dart';

class ServiceIot with ChangeNotifier {
  static const urlDominion = 'localhost:3000';
  static const getIotsEndPoint = "/iots";
  List<Iot> iots = [];

  Future<String?> getIots(String user_id) async {
    final body = {'id': user_id};

    final url = Uri.http(
      urlDominion,
      getIotsEndPoint,
      body,
    );

    http.Response response;

    try {
      response = await http.get(
        url,
      );
    } catch (e) {
      return "Falha ao comunicar com o servidor";
    }

    final list = json.decode(response.body) as List;

    for (var i = 0; i < list.length; i++) {
      final data = list[i];
      iots.add(Iot(
        id: data["_id"],
        name: data["name"],
        description: data["description"],
        user: data["user"],
        timer: data["timer"],
      ));
    }

    notifyListeners();
  }
}
