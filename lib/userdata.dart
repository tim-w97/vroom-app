import 'package:vroom_campus_app/userdata.dart';

import 'model/car.dart';
import 'model/user.dart';

class UserDataModel {
  User userContainer = User(
      firstName: "John",
      surName: "Doe",
      email: "fake@mail.com",
      password: "1234",
      cars: [Car(licensePlate: "HOF 420", model: "BMW", color: "Gray", imageURL: "NONE")]);
  
  UserDataModel._privateConstructor();
  static UserDataModel sharedInstance = UserDataModel._privateConstructor();

  static UserDataModel init() {
    return sharedInstance;
  }
}
