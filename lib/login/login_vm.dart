
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class LoginVM extends ChangeNotifier {
  //String _userName = "";
  //String _password = "";

  void decodeBase64(String username,String password) {
    Codec<String,String> authBase64 = utf8.fuse(base64);
    String encoded = authBase64.encode('$username:$password');
    print(encoded);
  }

}