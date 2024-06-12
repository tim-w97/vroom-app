import 'package:flutter/material.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:vroom_campus_app/passwd.dart';

import '../model/car.dart';
import '../userdata.dart';

class RideVM extends ChangeNotifier {
  OpenRouteService openRouteService =
      OpenRouteService(apiKey: AppConfigs.API_KEY);
  List<Car> cars = UserDataModel.sharedInstance.userContainer.cars!;

  void removeCar(Car car) {
    cars.remove(car);
    notifyListeners();
  }
}
