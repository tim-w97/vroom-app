import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:vroom_campus_app/model/user.dart';
import 'package:vroom_campus_app/network_helper.dart';

import '../model/car.dart';

class RideVM extends ChangeNotifier {
  OpenRouteService openRouteService =
      OpenRouteService(apiKey: dotenv.env['API_KEY'] ?? "");
  User currentUser = User(id:"",firstName: "", lastName: "", email: "", password: "");
  NetworkHelper networkHelper = NetworkHelper();
  List<Car> cars = [];

  RideVM() {
    _initialize();
  }

  Future<void> _initialize() async {
    await networkHelper.init();
    if(!networkHelper.isLoading) {
      currentUser = await networkHelper.getUser();
    }
    notifyListeners();
  }

  void removeCar(Car car) {
    cars.remove(car);
    notifyListeners();
  }
}
