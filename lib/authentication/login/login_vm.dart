import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/user.dart';
import '../../userdata.dart';

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

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      print(response.statusCode);
      print("Login successfull");
      notifyListeners();
    } else {
      print(response.statusCode);
      print("Login not successfull");
      print(response.statusCode);
      throw Exception('Failed to login');
    }
  }

  Future<void> getUserByID() async { //getUserByID
    //localhost:8080/user/666982c25f80fbef281ec783
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
    final response = await http.get(
      Uri.parse('$API_URL/user/666982c25f80fbef281ec783'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      Map<String,dynamic> jsonMap = jsonDecode(response.body);
      UserDataModel.sharedInstance.userContainer.surName = jsonMap['firstName'];
      notifyListeners();
    } else {
      print(response.statusCode);
    }
  }

  void decodeBase64() {
    decodedString = utf8.decode(base64Decode(_username));
    notifyListeners();
  }
}
