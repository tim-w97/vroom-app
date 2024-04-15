import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/register/register_vm.dart';

import '../authentication_vm.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => RegisterVM(),
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Register"),
      ),
      body: Center(
        child: Column(children: [
          Consumer<AuthenticationVM>(builder: (context,vm,child) {
            return ElevatedButton(onPressed: () {
              vm.toggleScreen();
            }, child: Text(vm.currentScreen.toString()));
          }),
        ],)
      ),
    ));
  }
}
