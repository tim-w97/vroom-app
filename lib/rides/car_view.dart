import 'package:flutter/material.dart';
import 'package:vroom_campus_app/rides/map_view.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              const Text("Mit welchem Auto fährst du?"),
              const Padding(padding: EdgeInsets.all(10)),
              Image.asset('lib/assets/images/auto.png'),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    print("+");
                  },
                  child: const Text("+ Neues Fahrzeug")),
              const Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapView()),
                  );
                },
                child: const Icon(Icons.arrow_forward)),
          ),
        ),
      ],
    );
  }
}
