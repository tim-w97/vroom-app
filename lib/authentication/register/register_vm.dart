
import 'package:flutter/cupertino.dart';

class RegisterVM extends ChangeNotifier {
  //TODO maybe user dataclass
  String _username = "";
  String _password = "";
  String _email = "";

  String get username {
    return _username;
  }

  void setUsername(String username) {
    _username = username;
  }

  String get password {
    return _password;
  }

  void setPassword(String password,String validatePassword) {
    if(password == validatePassword) {
      _password = password;
    }
    //TODO Else display error to screen that passwords don't match
  }

  String get email {
    return _email;
  }

  void setEmail(String email) {
    //TODO validate domain
    _email = email;
  }


}