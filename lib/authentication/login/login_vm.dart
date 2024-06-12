import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginVM extends ChangeNotifier {
  String _username = "";
  String _password = "";
  String decodedString = "";
  String API_URL = dotenv.env['API_URL'] ?? "";

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));

    final response = await http.post(
      Uri.parse('$API_URL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );
    print("okay");

    if (response.statusCode == 201) {
      final responseJson = jsonDecode(response.body);
      print(response.statusCode);
      print("Login successfull");
      notifyListeners();
    } else {
      print("Login not successfull");
      print(response.statusCode);
      throw Exception('Failed to login');
    }
  }

  void decodeBase64() {
    decodedString = utf8.decode(base64Decode(_username));
    notifyListeners();
  }
}
