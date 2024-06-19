import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/car_upload_dummy_screen.dart';
import 'package:vroom_campus_app/rides/car_vm.dart';
import 'package:vroom_campus_app/rides/map_view.dart';
import 'package:vroom_campus_app/rides/ride_vm.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RideVM(),
      child: Stack(
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
                      final route = MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider<CarVM>(
                          create: (context) => CarVM(),
                          builder: (context, child) {
                            return const CarUploadDummyScreen();
                          }
                        ),
                      );

                      Navigator.of(context).push(route);
                    },
                    child: const Text("+ Neues Fahrzeug")),
                Consumer<RideVM>(builder: (context,vm,child) {
                return Column(children: vm.cars
                    .map<Widget>(
                      (car) => Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${car.model} / ${car.licensePlate}"),
                        GestureDetector(
                          onTap: () => vm.removeCar(car),
                          child: const Icon(
                              Icons.delete_outline),
                        ),
                    ],
                  ),
                )
                    .toList(),);
                }),
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
      ),
    );
  }
}
