import 'package:flutter/cupertino.dart';

import '../model/car.dart';
import '../model/gender.dart';
import '../model/multi_button_action.dart';

class ProfileVM with ChangeNotifier {
  int _currentIndex = 0;
  bool _isEditing = false;
  bool _isEditingCars = false;

  late List<MultiButtonAction> genderSelect;
  String _name = "";
  String _surName = "";
  String _email = "";
  Gender _gender = Gender.female;

  ProfileVM() {
    genderSelect = [
      MultiButtonAction(name: "W", action: () {
        _setGender(Gender.female);
      }),
      MultiButtonAction(name: "M", action: () {
        _setGender(Gender.male);
      }),
      MultiButtonAction(name: "D", action: () {
        _setGender(Gender.diverse);
      }),];
  }
  int get currentIndex => _currentIndex;
  bool get isEditing => _isEditing;
  bool get isEditingCars => _isEditingCars;
  String get name => _name;
  String get surName => _surName;
  String get email => _email;
  Gender get gender => _gender;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void editButtonHandler() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void editCarsButtonHandler() {
    _isEditingCars = !_isEditingCars;
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

  void _setGender(Gender gender) {
    _gender = gender;
    notifyListeners();
  }

  MultiButtonAction get currentGender => genderSelect[_currentIndex];

  final List<Car> _cars = [
    Car(
        model: "Audi_A1",
        licensePlate: "WUN_TI",
        color: "schwarz",
        imageURL: "URL"),
    Car(model: "Passat", licensePlate: "HO_CG", color: "blau", imageURL: "URL"),
    Car(model: "Golf", licensePlate: "TOR_TI", color: "grau", imageURL: "URL")
  ];

  get cars => _cars;

  void removeCar(Car car) {
    _cars.remove(car);
    notifyListeners();
  }
}
