// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return _MyUser.fromJson(json);
}

/// @nodoc
mixin _$MyUser {
  int? get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this MyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyUserCopyWith<MyUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUserCopyWith<$Res> {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) then) =
      _$MyUserCopyWithImpl<$Res, MyUser>;
  @useResult
  $Res call({int? id, String uid, String name, String email});
}

/// @nodoc
class _$MyUserCopyWithImpl<$Res, $Val extends MyUser>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUserImplCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$$MyUserImplCopyWith(
          _$MyUserImpl value, $Res Function(_$MyUserImpl) then) =
      __$$MyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String uid, String name, String email});
}

/// @nodoc
class __$$MyUserImplCopyWithImpl<$Res>
    extends _$MyUserCopyWithImpl<$Res, _$MyUserImpl>
    implements _$$MyUserImplCopyWith<$Res> {
  __$$MyUserImplCopyWithImpl(
      _$MyUserImpl _value, $Res Function(_$MyUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$MyUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyUserImpl implements _MyUser {
  _$MyUserImpl(
      {this.id, required this.uid, required this.name, required this.email});

  factory _$MyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyUserImplFromJson(json);

  @override
  final int? id;
  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'MyUser(id: $id, uid: $uid, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, name, email);

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      __$$MyUserImplCopyWithImpl<_$MyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyUserImplToJson(
      this,
    );
  }
}

abstract class _MyUser implements MyUser {
  factory _MyUser(
      {final int? id,
      required final String uid,
      required final String name,
      required final String email}) = _$MyUserImpl;

  factory _MyUser.fromJson(Map<String, dynamic> json) = _$MyUserImpl.fromJson;

  @override
  int? get id;
  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of MyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyUserImplCopyWith<_$MyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
