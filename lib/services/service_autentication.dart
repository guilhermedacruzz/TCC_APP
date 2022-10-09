import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utils/defs.dart';

class ServiceAutentication with ChangeNotifier {
  static const urlDominion = 'identitytoolkit.googleapis.com';
  static const signUpEndPoint = "/v1/accounts:signUp";
  static const signInEndPoint = "/v1/accounts:signInWithPassword";

  User? _user;
  User? get user => _user;
  bool _logged = false;
  bool get logged => _logged;

  Future<String?> singUp(String email, String password) async {
    return _signUpOrIn(email, password, register: true);
  }

  Future<String?> singIn(String email, String password) async {
    return _signUpOrIn(email, password);
  }

  Future<String?> _signUpOrIn(String email, String password,
      {bool register = false}) async {
    String? msg;

    final url = Uri.https(
      urlDominion,
      (register) ? signUpEndPoint : signInEndPoint,
      {'key': API_KEY},
    );

    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 400) {
      if (register) {
        if (data['error']['message'] == 'EMAIL_EXISTS') {
          msg = 'E-mail já cadastrado';
        } else {
          msg = 'Erro!';
        }
      } else {
        msg = 'E-mail ou senha inválidos';
      }
      return msg;
    }

    final user = User(
      id: data['localId'],
      email: email,
      token: data['idToken'],
      expiration: DateTime.now().add(
        Duration(
          seconds: int.parse(
            data['expiresIn'],
          ),
        ),
      ),
    );

    _user = user;
    _logged = true;
    notifyListeners();
  }

  logout() {
    _user = null;
    _logged = false;
    notifyListeners();
  }
}
