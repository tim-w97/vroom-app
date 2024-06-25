import 'package:vroom_campus_app/model/location.dart';

import 'repeat_period.dart';

import 'package:json_annotation/json_annotation.dart';
part 'ride.g.dart';

@JsonSerializable()
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

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

  Map<String, dynamic> toJson() => _$RideToJson(this);
}
