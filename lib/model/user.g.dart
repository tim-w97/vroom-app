// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      description: json['description'] as String?,
      evaluation: (json['evaluation'] as num?)?.toInt(),
      image: json['image'] as String?,
      favoriteDrivers: (json['favoriteDrivers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rememberedRides: (json['rememberedRides'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cars: (json['cars'] as List<dynamic>?)
          ?.map((e) => Car.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'gender': _$GenderEnumMap[instance.gender],
      'description': instance.description,
      'evaluation': instance.evaluation,
      'image': instance.image,
      'favoriteDrivers': instance.favoriteDrivers,
      'rememberedRides': instance.rememberedRides,
      'cars': instance.cars,
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
  Gender.diverse: 'diverse',
};
