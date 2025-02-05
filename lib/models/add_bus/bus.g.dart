// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddBusImpl _$$AddBusImplFromJson(Map<String, dynamic> json) => _$AddBusImpl(
      number: (json['number'] as num).toInt(),
      source: json['source'] as String,
      destination: json['destination'] as String,
      isActive: json['isActive'] as bool,
      roadMap: json['roadMap'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AddBusImplToJson(_$AddBusImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'source': instance.source,
      'destination': instance.destination,
      'isActive': instance.isActive,
      'roadMap': instance.roadMap,
    };
