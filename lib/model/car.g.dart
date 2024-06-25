// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      licensePlate: json['licensePlate'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      imageURL: json['imageURL'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'licensePlate': instance.licensePlate,
      'model': instance.model,
      'color': instance.color,
      'imageURL': instance.imageURL,
    };
