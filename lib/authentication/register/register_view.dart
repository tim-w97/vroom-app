import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/authentication/register/register_vm.dart';

import '../authentication_vm.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterVM(),
        child: Scaffold(
          body: Center(
              child: Column(
            children: [
              Consumer<AuthenticationVM>(
                builder: (context, vm, child) {
                  return ElevatedButton(
                      onPressed: () {
                        vm.toggleScreen();
                      },
                      child: const Text("Switch to login"));
                },
              ),
              Consumer<RegisterVM>(
                builder: (context, vm, child) {
                  return Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setUsername(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setEmail(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setPassword(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.validatePassword(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Repeat Password'),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          )),
        ));
  }
}
