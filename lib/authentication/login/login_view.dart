import 'package:easy_localization/easy_localization.dart';
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
        body: Center(
          child: Column(
            children: [
              Consumer<AuthenticationVM>(builder: (context, vm, child) {
                return ElevatedButton(
                    onPressed: () {
                      vm.toggleScreen();
                    },
                    child: Text("switch_register".tr()));
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
                            labelText: "username_email_login".tr()),
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
                            labelText: "password_login".tr()),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                        onPressed: () {
                          vm.decodeBase64();
                        },
                        child: Text("login_button".tr()))
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
