// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverImpl _$$DriverImplFromJson(Map<String, dynamic> json) => _$DriverImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      number: json['number'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$DriverImplToJson(_$DriverImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'email': instance.email,
    };
