import 'package:flutter/material.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Mit welchem Auto fährst du?"),
          ElevatedButton(
              onPressed: () {
                print("+");
              },
              child: const Text("+ Neues Fahrzeug"))
        ],
      ),
    );
  }
}
