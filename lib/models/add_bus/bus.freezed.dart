// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddBus _$AddBusFromJson(Map<String, dynamic> json) {
  return _AddBus.fromJson(json);
}

/// @nodoc
mixin _$AddBus {
  int get number => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic> get roadMap => throw _privateConstructorUsedError;

  /// Serializes this AddBus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddBus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddBusCopyWith<AddBus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddBusCopyWith<$Res> {
  factory $AddBusCopyWith(AddBus value, $Res Function(AddBus) then) =
      _$AddBusCopyWithImpl<$Res, AddBus>;
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      Map<String, dynamic> roadMap});
}

/// @nodoc
class _$AddBusCopyWithImpl<$Res, $Val extends AddBus>
    implements $AddBusCopyWith<$Res> {
  _$AddBusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddBus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _value.roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddBusImplCopyWith<$Res> implements $AddBusCopyWith<$Res> {
  factory _$$AddBusImplCopyWith(
          _$AddBusImpl value, $Res Function(_$AddBusImpl) then) =
      __$$AddBusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      Map<String, dynamic> roadMap});
}

/// @nodoc
class __$$AddBusImplCopyWithImpl<$Res>
    extends _$AddBusCopyWithImpl<$Res, _$AddBusImpl>
    implements _$$AddBusImplCopyWith<$Res> {
  __$$AddBusImplCopyWithImpl(
      _$AddBusImpl _value, $Res Function(_$AddBusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddBus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
  }) {
    return _then(_$AddBusImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _value._roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddBusImpl implements _AddBus {
  _$AddBusImpl(
      {required this.number,
      required this.source,
      required this.destination,
      required this.isActive,
      required final Map<String, dynamic> roadMap})
      : _roadMap = roadMap;

  factory _$AddBusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddBusImplFromJson(json);

  @override
  final int number;
  @override
  final String source;
  @override
  final String destination;
  @override
  final bool isActive;
  final Map<String, dynamic> _roadMap;
  @override
  Map<String, dynamic> get roadMap {
    if (_roadMap is EqualUnmodifiableMapView) return _roadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roadMap);
  }

  @override
  String toString() {
    return 'AddBus(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBusImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._roadMap, _roadMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, source, destination,
      isActive, const DeepCollectionEquality().hash(_roadMap));

  /// Create a copy of AddBus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBusImplCopyWith<_$AddBusImpl> get copyWith =>
      __$$AddBusImplCopyWithImpl<_$AddBusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddBusImplToJson(
      this,
    );
  }
}

abstract class _AddBus implements AddBus {
  factory _AddBus(
      {required final int number,
      required final String source,
      required final String destination,
      required final bool isActive,
      required final Map<String, dynamic> roadMap}) = _$AddBusImpl;

  factory _AddBus.fromJson(Map<String, dynamic> json) = _$AddBusImpl.fromJson;

  @override
  int get number;
  @override
  String get source;
  @override
  String get destination;
  @override
  bool get isActive;
  @override
  Map<String, dynamic> get roadMap;

  /// Create a copy of AddBus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddBusImplCopyWith<_$AddBusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
