import 'package:vroom_campus_app/model/location.dart';

import 'repeat_period.dart';

class Ride {

  String ID;
  String driverEmail;
  List<String> passengerEmails;
  DateTime departureTime;
  Location startLocation;
  Location endLocation;
  RepeatPeriod? repeatPeriod;

  Ride({
    required this.ID,
    required this.driverEmail,
    required this.passengerEmails,
    required this.departureTime,
    required this.startLocation,
    required this.endLocation,
    this.repeatPeriod
  });
}
