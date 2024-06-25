import 'dart:convert';


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_campus_app/userdefaults/keys.dart';

import 'model/user.dart';

class NetworkHelper {
  final String API_URL = dotenv.env['API_URL'] ?? "";
  late final SharedPreferences prefs;

  NetworkHelper() {

  }

  _init() async { //TODO Loading or nullable
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> login(String username, String password) async {
    final String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

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
    } else {
      print(response.statusCode);
    }
  }

  Future<User> getUser() async {
    prefs = await SharedPreferences.getInstance();
    print("called");
    final String basicAuth = '${prefs.getString(SharedPreferencesKeys.base64Authentication.toString())!}';
    final response = await http.get(
      Uri.parse('$API_URL/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
      //final User user = jsonMap;

    } else {
      print(response.statusCode);
      return User(firstName: "", lastName: "", email: "", password: "");
    }
  }

}