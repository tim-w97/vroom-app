// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      ID: json['ID'] as String,
      driverEmail: json['driverEmail'] as String,
      passengerEmails: (json['passengerEmails'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      departureTime: DateTime.parse(json['departureTime'] as String),
      startLocation:
          Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      endLocation:
          Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      repeatPeriod:
          $enumDecodeNullable(_$RepeatPeriodEnumMap, json['repeatPeriod']),
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'ID': instance.ID,
      'driverEmail': instance.driverEmail,
      'passengerEmails': instance.passengerEmails,
      'departureTime': instance.departureTime.toIso8601String(),
      'startLocation': instance.startLocation,
      'endLocation': instance.endLocation,
      'repeatPeriod': _$RepeatPeriodEnumMap[instance.repeatPeriod],
    };

const _$RepeatPeriodEnumMap = {
  RepeatPeriod.daily: 'daily',
  RepeatPeriod.weekly: 'weekly',
  RepeatPeriod.monthly: 'monthly',
  RepeatPeriod.yearly: 'yearly',
};
