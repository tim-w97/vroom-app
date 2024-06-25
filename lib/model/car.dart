import 'package:json_annotation/json_annotation.dart';
part 'car.g.dart';

@JsonSerializable()
class Car {
  String licensePlate;
  String model;
  String color;
  String? image;
  Car(
      {required this.licensePlate,
      required this.model,
      required this.color,
      required this.image});

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
