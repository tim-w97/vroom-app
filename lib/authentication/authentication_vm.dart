
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:vroom_campus_app/authentication/login/login_view.dart';
import 'package:vroom_campus_app/authentication/register/register_view.dart';

enum AuthenticationType {
  login,
  register
}

class AuthenticationVM extends ChangeNotifier {
List<StatelessWidget> dest = [LoginView(),RegisterView()];
late StatelessWidget currentSelection;

void update() {
  //TODO
  notifyListeners();
}
}