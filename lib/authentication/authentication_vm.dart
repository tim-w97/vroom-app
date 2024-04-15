
import 'package:flutter/cupertino.dart';
import 'package:vroom_campus_app/authentication/login/login_view.dart';
import 'package:vroom_campus_app/authentication/register/register_view.dart';

enum AuthenticationType {
  login,
  register
}

class AuthenticationVM extends ChangeNotifier {
StatelessWidget _currentSelection = const LoginView();
AuthenticationType _currentScreen = AuthenticationType.login;

AuthenticationType get currentScreen {
  return _currentScreen;
}

StatelessWidget get currentSelection {
  return _currentSelection;
}

void _setScreen() {
  switch(_currentScreen) {
    case AuthenticationType.login:
      _currentSelection = const LoginView();
      break;
    case AuthenticationType.register:
      _currentSelection = const RegisterView();
      break;
  }
}

void toggleScreen() {
  if(_currentScreen == AuthenticationType.login) {
    _currentScreen = AuthenticationType.register;
  } else {
    _currentScreen = AuthenticationType.login;
  }
  _setScreen();
  notifyListeners();
}
}