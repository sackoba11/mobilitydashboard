// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      id: (json['id'] as num?)?.toInt(),
      number: (json['number'] as num).toInt(),
      source: json['source'] as String,
      destination: json['destination'] as String,
      isActive: json['isActive'] as bool,
      roadMap: (json['roadMap'] as List<dynamic>)
          .map((e) => Stop.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] == null
          ? null
          : Stop.fromJson(json['position'] as Map<String, dynamic>),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'source': instance.source,
      'destination': instance.destination,
      'isActive': instance.isActive,
      'roadMap': instance.roadMap,
      'position': instance.position,
      'startDate': instance.startDate?.toIso8601String(),
    };
