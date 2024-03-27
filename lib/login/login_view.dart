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
      home: const LoginView(),
    );
  }
}
//

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Decode"),
              TextField(),
              TextField(),
              ElevatedButton(
                  onPressed: () => {
                    LoginVM().decodeBase64("Bob", "Password1")
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
