
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginVM extends ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  String _decodedString = "";

  String get decodedString {
    return _decodedString;
  }

  void decodeBase64(String username,String password) {
    Codec<String,String> authBase64 = utf8.fuse(base64);
    _decodedString = authBase64.encode('$username:$password');
    save();
    notifyListeners();
  }

  Future<void> save() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Base64Auth", _decodedString);
    print(sharedPreferences.get("Base64Auth"));
    notifyListeners();
  }

}