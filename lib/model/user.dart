import 'car.dart';
import 'gender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name:'_id')
  String id = "";

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";


  String? phoneNumber;
  Gender? gender;
  String? description;
  int? evaluation;
  String? image; //TODO Default picture when null
  List<String>? favoriteDrivers;
  List<String>? rememberedRides;
  List<Car>? cars;

  User ({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.gender,
    this.description,
    this.evaluation,
    this.image,
    this.favoriteDrivers,
    this.rememberedRides,
    this.cars,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

