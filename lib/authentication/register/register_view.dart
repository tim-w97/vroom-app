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
        appBar: AppBar(title:const Text('Register')),
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
                    child:const Text("Switch to Login"),
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
                            vm.setFirstName(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "First name"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setLastName(value);
                          },
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Last name"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            vm.setEmail(value);
                          },
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(),
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
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(),
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
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Repeat Password"),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                        onPressed: () async {
                          if (vm.passwordIsValid) {
                            try {
                              await vm.register(); // POST-Request
                              ScaffoldMessenger.of(context).showSnackBar( //TODO
                               const SnackBar(content: Text('Registration successful')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to register: $e')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: Text('Passwords do not match')),
                            );
                          }
                        },
                        child:const Text("Register"),
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
