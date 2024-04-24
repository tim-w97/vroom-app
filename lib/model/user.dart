import 'dart:ui';

import 'gender.dart';

class User {
  //Required
  String firstName = "";
  String surName = "";
  String email = "";
  String password = "";

  //Optional
  String? phoneNumber;
  Gender? gender;
  String? description;
  int? evaluation;
  Image? image; //TODO Default picture when null
  List<String>? favoriteDrivers;
  List<String>? rememberedRides;

  User({
    required this.firstName,
    required this.surName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.gender,
    this.description,
    this.evaluation,
    this.image,
    this.favoriteDrivers,
    this.rememberedRides,
  });
  
}
