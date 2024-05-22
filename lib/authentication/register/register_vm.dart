import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterVM extends ChangeNotifier {
  String _username = "";
  String _password = "";
  String _email = "";
  bool _passwordIsValid = false;

  String get username => _username;
  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String get password => _password;
  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get email => _email;
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  bool get passwordIsValid => _passwordIsValid;
  void validatePassword(String validatePassword) {
    _passwordIsValid = _password == validatePassword;
    notifyListeners();
  }

  Future<void> register() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _email,
        'password': _password,
      }),
    );

    if (response.statusCode == 201) { //mit anderen Statuscodes versuchen
      // Die Anfrage war erfolgreich
      print("registration successfull");
      print(response.statusCode);
      notifyListeners();
    } else {
      print("registration not successfull");
      print(response.statusCode);
      throw Exception('Failed to register');
    }
  }
}
