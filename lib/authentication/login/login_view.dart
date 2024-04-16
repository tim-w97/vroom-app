import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/authentication_vm.dart';

import 'login_vm.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginVM(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Login"),
        ),
        body: Center(
          child: Column(
            children: [
              Consumer<AuthenticationVM>(builder: (context,vm,child) {
                return ElevatedButton(onPressed: () {
                  vm.toggleScreen();
                }, child: const Text("Switch to register"));
              }),
              Consumer<LoginVM>(builder: (context, vm, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(vm.decodedString),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        onChanged: (value) {
                          vm.setUsername(value);
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username/E-mail'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        onChanged: (value) {
                          vm.setPassword(value);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Password'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                        onPressed: ()  {
                              vm.decodeBase64();
                            },
                        child: const Text("Login"))
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
