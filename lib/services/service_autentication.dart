import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ServiceAutentication with ChangeNotifier {
  static const urlDominion = '192.168.100.110:3000';
  static const signUpEndPoint = "/signup";
  static const signInEndPoint = "/users/signin";

  User? _user;
  User? get user => _user;
  bool _logged = false;
  bool get logged => _logged;

  Future<String?> singUp(String email, String password, String username) async {
    return _signUpOrIn(
      email: email,
      password: password,
      register: true,
      displayName: username,
    );
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

    var response;
    try {
      response = await http.post(
        url,
        body: body,
      );
    } catch (e) {
      return "Falha ao comunicar com o servidor";
    }

    if (response.statusCode == 400) {
      return "E-mail ou senha inválidos";
    }
    
    final data = json.decode(response.body);

    final user = User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      token: data["jwtToken"],
    );

    _user = user;
    _logged = true;
    notifyListeners();
  }

  Future<String?> _signUpOrIn({
    required email,
    required password,
    register = false,
    displayName,
  }) async {
    String? msg;

    final url = Uri.https(
      urlDominion,
      (register) ? signUpEndPoint : signInEndPoint,
    );

    print(url);

    final response = await http.post(
      url,
      body: json.encode({
        ...{
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
        ...(register) ? {'displayName': displayName} : {}
      }),
    );

    // final data = json.decode(response.body);

    // if (response.statusCode == 400) {
    //   if (register) {
    //     if (data['error']['message'] == 'EMAIL_EXISTS') {
    //       msg = 'E-mail já cadastrado';
    //     } else {
    //       msg = 'Erro!';
    //     }
    //   } else {
    //     msg = 'E-mail ou senha inválidos';
    //   }
    //   return msg;
    // }

    // final user = User(
    //   id: data['localId'],
    //   username: data['displayName'],
    //   email: email,
    //   token: data['idToken'],
    //   expiration: DateTime.now().add(
    //     Duration(
    //       seconds: int.parse(
    //         data['expiresIn'],
    //       ),
    //     ),
    //   ),
    // );

    // _user = user;
    // _logged = true;
    // notifyListeners();
  }

  logout() {
    _user = null;
    _logged = false;
    notifyListeners();
  }
}
