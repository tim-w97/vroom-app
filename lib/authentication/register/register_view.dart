import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/register/register_vm.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => RegisterVM(),
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Register Widget"),
      ),
      body: const Center(
        child: Text("Register"),
      ),
    ));
  }
}
