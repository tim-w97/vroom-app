import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_route_service/open_route_service.dart';

import '../model/car.dart';
import '../userdata.dart';

class RideVM extends ChangeNotifier {
  OpenRouteService openRouteService =
      OpenRouteService(apiKey: dotenv.env['API_KEY'] ?? "");
  List<Car> cars = UserDataModel.sharedInstance.userContainer.cars!;

  void removeCar(Car car) {
    cars.remove(car);
    notifyListeners();
  }
}
