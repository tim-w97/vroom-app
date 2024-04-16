
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_campus_app/userdefaults/keys.dart';
import 'package:vroom_campus_app/userdefaults/shared_preferences_helper.dart';

class LoginVM extends ChangeNotifier {
  late final SharedPreferences _sharedPreferences;
  String _decodedString = "";
  String _username = "";
  String _password = "";
  //bool  _saveLoginInfo; //TODO

  LoginVM() {
    _initSharedPreferences();
  }

  String get username {
    return _username;
  }

  void setUsername(String username) {
    _username = username;
  }

  String get password {
    return _password;
  }

  void setPassword(String password) {
    _password = password;
  }

  String get decodedString {
    return _decodedString;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferencesHelper.getInstance();
  }

  void decodeBase64() {
    Codec<String,String> authBase64 = utf8.fuse(base64);
    _decodedString = authBase64.encode('$_username:$_password');
    _sharedPreferences.setString(SharedPreferencesKeys.base64Authentication.toString(), _decodedString);
    notifyListeners();
  }

}