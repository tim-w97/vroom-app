import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_campus_app/userdefaults/keys.dart';

import 'model/user.dart';

class NetworkHelper {
  final String API_URL = dotenv.env['API_URL'] ?? "";
  bool isLoading = true;
  late final SharedPreferences prefs;

  //!!! Call this first before using the networkhelper !!!
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    isLoading = false;
  }

  Future<void> login(String username, String password) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.post(
      Uri.parse('$API_URL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );
    if (response.statusCode == 200) {
      prefs.setString(
          SharedPreferencesKeys.base64Authentication.toString(), basicAuth);
    } else {
      print(response.statusCode);
    }
  }

  Future<User> getUser() async {
    isLoading = true;
    final String basicAuth =
        prefs.getString(SharedPreferencesKeys.base64Authentication.toString())!;
    final response = await http.get(
      Uri.parse('$API_URL/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
    );
    if (response.statusCode == 200) { //TODO User feedback
      isLoading = false;
      return User.fromJson(jsonDecode(response.body));
    } else {
      isLoading = false;
      return User(id:"",firstName: "", lastName: "", email: "", password: "");
    }
  }

  Future<void> updateUser(User user) async {
    //route /user/id:
    isLoading = true;
    final String basicAuth =
      prefs.getString(SharedPreferencesKeys.base64Authentication.toString())!;
    final response = await http.patch(
      Uri.parse('$API_URL/user/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
      body: user.toJson()
    );
    isLoading = false;
  }
}
