// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
    };
