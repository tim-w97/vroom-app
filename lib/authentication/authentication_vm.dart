
import 'package:flutter/cupertino.dart';

enum AuthenticationType {
  login,
  register
}

class AuthenticationVM extends ChangeNotifier {
AuthenticationType _currentScreen = AuthenticationType.login;

AuthenticationType get currentScreen {
  return _currentScreen;
}

void toggleScreen() {
  if(_currentScreen == AuthenticationType.login) {
    _currentScreen = AuthenticationType.register;
  } else {
    _currentScreen = AuthenticationType.login;
  }
  notifyListeners();
}
}