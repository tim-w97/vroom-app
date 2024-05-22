import 'package:flutter/material.dart';

import '../model/car.dart';

class CarListTile extends StatelessWidget {
  const CarListTile({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text("${car.model} / ${car.licensePlate}")]);
  }
}
