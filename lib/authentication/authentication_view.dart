import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/authentication_vm.dart';
import 'package:vroom_campus_app/authentication/login/login_view.dart';
import 'package:vroom_campus_app/authentication/register/register_view.dart';

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
      home: const AuthenticationView(),
    );
  }
}

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  StatelessWidget toggleWitched(AuthenticationVM vm) {
    switch(vm.currentScreen) {
      case AuthenticationType.login:
        return const LoginView();
      case AuthenticationType.register:
        return const RegisterView();
    }
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=> AuthenticationVM(),
      child: Consumer<AuthenticationVM>(builder: (context, vm, child) {
        return toggleWitched(vm);
      }),
    );
  }
}
