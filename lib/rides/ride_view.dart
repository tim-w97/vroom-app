import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/rides/car_view.dart';
import 'package:vroom_campus_app/rides/ride_vm.dart';

class RideView extends StatelessWidget {
  const RideView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RideVM(),
      child: Consumer<RideVM>(builder: (context, vm, child) {
        return const Center(
          child: const CarView()
        );
      }),
    );
  }
}
