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
        appBar: AppBar(title: Text('Register')),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<AuthenticationVM>(builder: (context, vm, child) {
                  return ElevatedButton(
                    onPressed: () {
                      vm.toggleScreen();
                    },
                    child: Text("Switch to Login"),
                  );
                }),
                Consumer<RegisterVM>(builder: (context, vm, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setUsername(value);
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Username"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setEmail(value);
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Email"),
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
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Password"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.validatePassword(value);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Repeat Password"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                        onPressed: () async {
                          if (vm.passwordIsValid) {
                            try {
                              await vm.register(); // POST-Request
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registration successful')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to register: $e')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                          }
                        },
                        child: Text("Register"),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
