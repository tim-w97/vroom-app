import 'package:flutter/material.dart';
import 'package:vroom_campus_app/login/login_vm.dart';
import 'package:provider/provider.dart';

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
      home: LoginView(),
    );
  }
}
//

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginVM(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Login Test Widget"),
        ),
        body: Center(
          child: Consumer<LoginVM>(builder: (context, vm, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(vm.decodedString),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
                ElevatedButton(
                    onPressed: () => {
                          vm.decodeBase64(
                              usernameController.text, passwordController.text)
                        },
                    child: const Text("Login"))
              ],
            );
          }),
        ),
      ),
    );
  }
}
