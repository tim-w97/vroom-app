import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/ride_vm.dart';

class RideView extends StatelessWidget {
  const RideView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RideVM(),
      child: Consumer<RideVM>(builder: (context, vm, child) {
        return Scaffold(
          body: Center(
            child: FlutterMap(
              options: const MapOptions(),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  // Plenty of other options available!
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
