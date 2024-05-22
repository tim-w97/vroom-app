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
        appBar: AppBar(title: Text('Login')),
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
                    child: Text("Switch to Register"),
                  );
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
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Username or Email"),
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
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await vm.login(); // POST-Request
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login successful')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to login: $e')),
                            );
                          }
                        },
                        child: Text("Login"),
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
