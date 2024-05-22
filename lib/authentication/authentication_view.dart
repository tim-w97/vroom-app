import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/authentication_vm.dart';
import 'login/login_view.dart';
import 'register/register_view.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  StatelessWidget toggleWitched(AuthenticationVM vm) {
    switch (vm.currentScreen) {
      case AuthenticationType.login:
        return const LoginView();
      case AuthenticationType.register:
        return const RegisterView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationVM(),
      child: Consumer<AuthenticationVM>(builder: (context, vm, child) {
        return toggleWitched(vm);
      }),
    );
  }
}
