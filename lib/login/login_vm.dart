
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class LoginVM extends ChangeNotifier {

  String _decodedString = "";

  String get decodedString {
    return _decodedString;
  }

  void decodeBase64(String username,String password) {
    Codec<String,String> authBase64 = utf8.fuse(base64);
    _decodedString = authBase64.encode('$username:$password');
    print(_decodedString);
    notifyListeners();
  }

}