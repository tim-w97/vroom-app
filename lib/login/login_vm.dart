
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_campus_app/userdefaults/keys.dart';

class LoginVM extends ChangeNotifier {
  late final SharedPreferences _sharedPreferences;
  String _decodedString = "";
  //bool  _saveLoginInfo; //TODO

  LoginVM() {
    _initSharedPreferences();
  }

  String get decodedString {
    return _decodedString;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void decodeBase64(String username,String password) {
    Codec<String,String> authBase64 = utf8.fuse(base64);
    _decodedString = authBase64.encode('$username:$password');
    save();
    notifyListeners();
  }

  Future<void> save() async {
    _sharedPreferences.setString(SharedPreferencesKeys.base64Authentication.toString(), _decodedString);
    print(_sharedPreferences.get(SharedPreferencesKeys.base64Authentication.toString()));
    notifyListeners();
  }

}