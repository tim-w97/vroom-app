
import 'package:flutter/cupertino.dart';

class RegisterVM extends ChangeNotifier {
  //TODO maybe user dataclass
  String _username = "";
  String _password = "";
  String _email = "";
  bool _passwordIsValid = false;

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

  String get email {
    return _email;
  }

  void setEmail(String email) {
    //TODO validate domain
    _email = email;
  }

  bool get passwordIsValid {
    return _passwordIsValid;
  }

  //TODO move to sepreat function
  void validatePassword(String validatePassword) {
    if(_password == validatePassword) {
      _passwordIsValid = true;
    } else {
      _passwordIsValid = false;
      //TODO Else display error to screen that passwords don't match
    }

  }

}