import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_campus_app/userdefaults/keys.dart';

class NetworkHelper {
  final String API_URL = dotenv.env['API_URL'] ?? "";
  late final SharedPreferences prefs;

  Future<void> login(String username, String password) async {
    prefs = await SharedPreferences.getInstance();
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

}