import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/models/user.dart';

class ServiceAutentication with ChangeNotifier {
  static const urlDominion = '192.168.100.110:3000';
  static const signUpEndPoint = "/users/signup";
  static const signInEndPoint = "/users/signin";
  static const updateEndPoint = "/users/update";

  User? _user;
  User? get user => _user;
  bool _logged = false;
  bool get logged => _logged;

  Future<String?> singUp(String email, String password, String name) async {
    final url = Uri.http(
      urlDominion,
      signUpEndPoint,
    );

    final body = {
      'name': name,
      'email': email,
      'password': password,
    };

    http.Response response;
    try {
      response = await http.post(
        url,
        body: body,
      );
    } catch (e) {
      return "Falha ao comunicar com o servidor";
    }

    final data = json.decode(response.body);

    if (data['statusCode'] == 400 || response.statusCode == 404) {
      if (data['message'] == 'Email duplicate') {
        return 'E-mail já cadastrado';
      }
      return 'Erro!';
    }

    final user = User(
      id: data["_id"],
      name: data["name"],
      email: data["email"],
      token: data["jwtToken"],
    );

    _user = user;
    _logged = true;
    notifyListeners();
  }

  Future<String?> singIn(String email, String password) async {
    final url = Uri.http(
      urlDominion,
      signInEndPoint,
    );

    final body = {
      'email': email,
      'password': password,
    };

    http.Response response;
    try {
      response = await http.post(
        url,
        body: body,
      );
    } catch (e) {
      return "Falha ao comunicar com o servidor";
    }

    final data = json.decode(response.body);

    if (response.statusCode == 400 || response.statusCode == 404) {
      return "E-mail ou senha inválidos";
    }

    final user = User(
      id: data["_id"],
      name: data["name"],
      email: data["email"],
      token: data["jwtToken"],
    );

    _user = user;
    _logged = true;
    notifyListeners();
  }

  Future<String?> update({
    required email,
    password,
    name,
  }) async {

    final url = Uri.http(
      urlDominion,
      updateEndPoint,
    );

    final body = {
      'email': email,
    };

    body.addAll(
      (password != null) ? {'password': password} : {'name': name},
    );

    http.Response response;
    try {
      response = await http.patch(
        url,
        body: body,
      );
    } catch (e) {
      return "Falha ao comunicar com o servidor";
    }

    if (response.statusCode == 400 || response.statusCode == 404) {
      return "Erro ao trocar a senha!";
    }

    final data = json.decode(response.body);

    if(_user != null) {
      _user!.email = data['email'];
      _user!.name = data['name'];
    }

    notifyListeners();
  }

  logout() {
    _user = null;
    _logged = false;
    notifyListeners();
  }
}
