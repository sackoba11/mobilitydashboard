// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableColumnImpl _$$TableColumnImplFromJson(Map<String, dynamic> json) =>
    _$TableColumnImpl(
      title: json['title'] as String,
      enableRowChecked: json['enableRowChecked'] as bool,
      type: json['type'],
    );

Map<String, dynamic> _$$TableColumnImplToJson(_$TableColumnImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'enableRowChecked': instance.enableRowChecked,
      'type': instance.type,
    };
