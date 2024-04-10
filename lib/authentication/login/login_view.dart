import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_vm.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({
    super.key,
  });

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
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username/E-mail'),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
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
