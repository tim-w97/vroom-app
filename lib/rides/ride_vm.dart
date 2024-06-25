import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:vroom_campus_app/model/user.dart';

import '../model/car.dart';

class RideVM extends ChangeNotifier {
  OpenRouteService openRouteService =
      OpenRouteService(apiKey: dotenv.env['API_KEY'] ?? "");
  User currentUser = User(firstName: "", lastName: "", email: "", password: "");
  List<Car> cars = [];

  void removeCar(Car car) {
    cars.remove(car);
    notifyListeners();
  }
}
