import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/authentication_vm.dart';
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
      home: const AuthenticationView(),
    );
  }
}

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});


  @override
  Widget build(BuildContext context) {
    //TODO switch between login and register
    return ChangeNotifierProvider(
      create: (context)=> AuthenticationVM(),
      child: RegisterView(),
    );
  }
}
