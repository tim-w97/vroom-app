
import 'package:flutter/cupertino.dart';

import '../model/car.dart';
import '../model/multi_button_action.dart';

class ProfileVM with ChangeNotifier {
  
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<MultiButtonAction> genderSelect = [
    MultiButtonAction(name: "W", action: () {}),
    MultiButtonAction(name: "M", action: () {}),
    MultiButtonAction(name: "D", action: () {}),
  ];

  MultiButtonAction get currentGender => genderSelect[_currentIndex];

  final List<Car> _cars = [
    Car(
        model: "Audi_A1",
        licensePlate: "WUN_TI",
        color: "schwarz",
        imageURL: "URL"),
    Car(
        model: "Passat",
        licensePlate: "HO_CG",
        color: "blau",
        imageURL: "URL"
    ),
    Car(
        model: "Golf",
        licensePlate: "TOR_TI",
        color: "grau",
        imageURL: "URL"
    )
  ];

  get cars => _cars;
}