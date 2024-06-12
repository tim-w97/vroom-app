import 'package:flutter/cupertino.dart';
import 'package:vroom_campus_app/model/user.dart';
import 'package:vroom_campus_app/userdata.dart';

import '../model/car.dart';
import '../model/gender.dart';
import '../model/multi_button_action.dart';

class ProfileVM with ChangeNotifier {
  final UserDataModel _userDataModel = UserDataModel.sharedInstance;
  int _currentIndex = 0;
  bool _isEditing = false;
  bool _isEditingCars = false;
  User _user = User(firstName: "firstName", surName: "", email: "", password: "");
  late List<MultiButtonAction> genderSelect;

  ProfileVM() {
    _user = _userDataModel.userContainer;
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
  String get name => _user.firstName;
  String get surName => _user.surName;
  String get email => _user.email;
  Gender get gender => _user.gender ?? Gender.diverse;

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
    _user.firstName = name;
    notifyListeners();
  }

  void setSurName(String surName) {
    _user.surName = surName;
    notifyListeners();
  }

  void setEMail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void _setGender(Gender gender) {
    _user.gender = gender;
    notifyListeners();
  }

  MultiButtonAction get currentGender => genderSelect[_currentIndex];


  get cars => _user.cars;

  void removeCar(Car car) {
    _user.cars!.remove(car);
    notifyListeners();
  }
}
