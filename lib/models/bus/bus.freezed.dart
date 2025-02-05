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

Bus _$BusFromJson(Map<String, dynamic> json) {
  return _Bus.fromJson(json);
}

/// @nodoc
mixin _$Bus {
  int? get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<Stop> get roadMap => throw _privateConstructorUsedError;
  Stop? get position => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// Serializes this Bus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusCopyWith<Bus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) then) =
      _$BusCopyWithImpl<$Res, Bus>;
  @useResult
  $Res call(
      {int? id,
      int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop? position,
      DateTime? startDate});

  $StopCopyWith<$Res>? get position;
}

/// @nodoc
class _$BusCopyWithImpl<$Res, $Val extends Bus> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as List<Stop>,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StopCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $StopCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusImplCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$$BusImplCopyWith(_$BusImpl value, $Res Function(_$BusImpl) then) =
      __$$BusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop? position,
      DateTime? startDate});

  @override
  $StopCopyWith<$Res>? get position;
}

/// @nodoc
class __$$BusImplCopyWithImpl<$Res> extends _$BusCopyWithImpl<$Res, _$BusImpl>
    implements _$$BusImplCopyWith<$Res> {
  __$$BusImplCopyWithImpl(_$BusImpl _value, $Res Function(_$BusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_$BusImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as List<Stop>,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusImpl implements _Bus {
  _$BusImpl(
      {this.id,
      required this.number,
      required this.source,
      required this.destination,
      required this.isActive,
      required final List<Stop> roadMap,
      required this.position,
      required this.startDate})
      : _roadMap = roadMap;

  factory _$BusImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusImplFromJson(json);

  @override
  final int? id;
  @override
  final int number;
  @override
  final String source;
  @override
  final String destination;
  @override
  final bool isActive;
  final List<Stop> _roadMap;
  @override
  List<Stop> get roadMap {
    if (_roadMap is EqualUnmodifiableListView) return _roadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roadMap);
  }

  @override
  final Stop? position;
  @override
  final DateTime? startDate;

  @override
  String toString() {
    return 'Bus(id: $id, number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._roadMap, _roadMap) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      source,
      destination,
      isActive,
      const DeepCollectionEquality().hash(_roadMap),
      position,
      startDate);

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      __$$BusImplCopyWithImpl<_$BusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusImplToJson(
      this,
    );
  }
}

abstract class _Bus implements Bus {
  factory _Bus(
      {final int? id,
      required final int number,
      required final String source,
      required final String destination,
      required final bool isActive,
      required final List<Stop> roadMap,
      required final Stop? position,
      required final DateTime? startDate}) = _$BusImpl;

  factory _Bus.fromJson(Map<String, dynamic> json) = _$BusImpl.fromJson;

  @override
  int? get id;
  @override
  int get number;
  @override
  String get source;
  @override
  String get destination;
  @override
  bool get isActive;
  @override
  List<Stop> get roadMap;
  @override
  Stop? get position;
  @override
  DateTime? get startDate;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
