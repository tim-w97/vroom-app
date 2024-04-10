import 'package:flutter/material.dart';
import 'package:vroom_campus_app/authentication/register/register_view.dart';

import 'login/login_view.dart';

//Run this for testing the widget we kick this out later ;)
void main() {
  runApp(const TestWidget());
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: AuthenticationView(),
    );
  }
}

// TODO Maybe this shouldn't be a separate view?
class AuthenticationView extends StatelessWidget {
  AuthenticationView({super.key});

  final usernameController = TextEditingController();   //TODO Move these two controller inside the LoginWidget?
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginWidget(usernameController: usernameController, passwordController: passwordController);
  }
}
