import 'dart:ui';

import 'gender.dart';

class User {
  //Required
  String _firstName = "";
  String _surName = "";
  String _email = "";
  String _password = "";
  int _evaluation = 0;

  //Optional
  String ?_phoneNumber;
  Gender ?_gender;
  String ?_description;
  Image ? _image; //TODO Default picture when null

  //TODO constructor
}