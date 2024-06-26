import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vroom_campus_app/model/user.dart';

class RegisterVM extends ChangeNotifier {
  User _newUser = User(id: '', firstName: '', lastName: '', email: '', password: '');
  bool _passwordIsValid = false;
  String API_URL = dotenv.env['API_URL'] ?? "";

  String get firstName => _newUser.firstName;
  void setFirstName(String firstName) {
    _newUser.firstName = firstName;
  }

  String get LastName => _newUser.firstName;
  void setLastName(String lastName) {
    _newUser.lastName = lastName;
  }

  String get password => _newUser.password;
  void setPassword(String password) {
    _newUser.password = password;
    notifyListeners();
  }

  String get email => _newUser.email;
  void setEmail(String email) {
    _newUser.email = email;
    notifyListeners();
  }

  bool get passwordIsValid => _passwordIsValid;
  void validatePassword(String validatePassword) {
    _passwordIsValid = _newUser.password == validatePassword;
    notifyListeners();
  }

  Future<void> register() async {
    final response = await http.post(
      Uri.parse('$API_URL/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': _newUser.firstName,
        'lastName': _newUser.lastName,
        'email': _newUser.email,
        'password': _newUser.password,
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
