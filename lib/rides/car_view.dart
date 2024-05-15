import 'package:flutter/material.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Mit welchem Auto fährst du?"),
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                print("+");
              },
              child: const Text("+ Neues Fahrzeug")),
        Image.asset('lib/assets/images/auto.png'),
          const Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(onPressed: (){},child: const Icon(Icons.arrow_forward))
        ],
      ),

    );
  }
}
