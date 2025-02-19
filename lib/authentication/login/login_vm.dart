import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_campus_app/network_helper.dart';
import 'package:vroom_campus_app/userdefaults/keys.dart';
import 'dart:convert';




class LoginVM extends ChangeNotifier {
  NetworkHelper networkHelper = NetworkHelper();
  String _username = "";
  String _password = "";
  String decodedString = "";
  String API_URL = dotenv.env['API_URL'] ?? "";
  late SharedPreferences prefs;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    prefs = await SharedPreferences.getInstance();
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));

    final response = await http.post(
      Uri.parse('$API_URL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      prefs.setString(SharedPreferencesKeys.base64Authentication.toString(), basicAuth);
      final responseJson = jsonDecode(response.body);

      notifyListeners();
    } else {
      print(response.statusCode);
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
