// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableRow _$TableRowFromJson(Map<String, dynamic> json) {
  return _TableRow.fromJson(json);
}

/// @nodoc
mixin _$TableRow {
  Map<String, dynamic> get cells => throw _privateConstructorUsedError;

  /// Serializes this TableRow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableRowCopyWith<TableRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableRowCopyWith<$Res> {
  factory $TableRowCopyWith(TableRow value, $Res Function(TableRow) then) =
      _$TableRowCopyWithImpl<$Res, TableRow>;
  @useResult
  $Res call({Map<String, dynamic> cells});
}

/// @nodoc
class _$TableRowCopyWithImpl<$Res, $Val extends TableRow>
    implements $TableRowCopyWith<$Res> {
  _$TableRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
  }) {
    return _then(_value.copyWith(
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableRowImplCopyWith<$Res>
    implements $TableRowCopyWith<$Res> {
  factory _$$TableRowImplCopyWith(
          _$TableRowImpl value, $Res Function(_$TableRowImpl) then) =
      __$$TableRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> cells});
}

/// @nodoc
class __$$TableRowImplCopyWithImpl<$Res>
    extends _$TableRowCopyWithImpl<$Res, _$TableRowImpl>
    implements _$$TableRowImplCopyWith<$Res> {
  __$$TableRowImplCopyWithImpl(
      _$TableRowImpl _value, $Res Function(_$TableRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cells = null,
  }) {
    return _then(_$TableRowImpl(
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableRowImpl implements _TableRow {
  _$TableRowImpl({required final Map<String, dynamic> cells}) : _cells = cells;

  factory _$TableRowImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableRowImplFromJson(json);

  final Map<String, dynamic> _cells;
  @override
  Map<String, dynamic> get cells {
    if (_cells is EqualUnmodifiableMapView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cells);
  }

  @override
  String toString() {
    return 'TableRow(cells: $cells)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableRowImpl &&
            const DeepCollectionEquality().equals(other._cells, _cells));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cells));

  /// Create a copy of TableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableRowImplCopyWith<_$TableRowImpl> get copyWith =>
      __$$TableRowImplCopyWithImpl<_$TableRowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableRowImplToJson(
      this,
    );
  }
}

abstract class _TableRow implements TableRow {
  factory _TableRow({required final Map<String, dynamic> cells}) =
      _$TableRowImpl;

  factory _TableRow.fromJson(Map<String, dynamic> json) =
      _$TableRowImpl.fromJson;

  @override
  Map<String, dynamic> get cells;

  /// Create a copy of TableRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableRowImplCopyWith<_$TableRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
