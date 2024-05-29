
import 'package:flutter/cupertino.dart';

import '../model/car.dart';
import '../model/multi_button_action.dart';

class ProfileVM with ChangeNotifier {
  
  int _currentIndex = 0;
  String _name = "";
  String _surName = "";
  String _email = "";

  int get currentIndex => _currentIndex;
  String get name => _name;
  String get surName => _surName;
  String get email => _email;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSurName(String surName) {
    _surName = surName;
    notifyListeners();
  }

  void setEMail(String email) {
    _email = email;
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