// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableColumn _$TableColumnFromJson(Map<String, dynamic> json) {
  return _TableColumn.fromJson(json);
}

/// @nodoc
mixin _$TableColumn {
  String get title => throw _privateConstructorUsedError;
  bool get enableRowChecked => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;

  /// Serializes this TableColumn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableColumnCopyWith<TableColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableColumnCopyWith<$Res> {
  factory $TableColumnCopyWith(
          TableColumn value, $Res Function(TableColumn) then) =
      _$TableColumnCopyWithImpl<$Res, TableColumn>;
  @useResult
  $Res call({String title, bool enableRowChecked, dynamic type});
}

/// @nodoc
class _$TableColumnCopyWithImpl<$Res, $Val extends TableColumn>
    implements $TableColumnCopyWith<$Res> {
  _$TableColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? enableRowChecked = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      enableRowChecked: null == enableRowChecked
          ? _value.enableRowChecked
          : enableRowChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableColumnImplCopyWith<$Res>
    implements $TableColumnCopyWith<$Res> {
  factory _$$TableColumnImplCopyWith(
          _$TableColumnImpl value, $Res Function(_$TableColumnImpl) then) =
      __$$TableColumnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, bool enableRowChecked, dynamic type});
}

/// @nodoc
class __$$TableColumnImplCopyWithImpl<$Res>
    extends _$TableColumnCopyWithImpl<$Res, _$TableColumnImpl>
    implements _$$TableColumnImplCopyWith<$Res> {
  __$$TableColumnImplCopyWithImpl(
      _$TableColumnImpl _value, $Res Function(_$TableColumnImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? enableRowChecked = null,
    Object? type = freezed,
  }) {
    return _then(_$TableColumnImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      enableRowChecked: null == enableRowChecked
          ? _value.enableRowChecked
          : enableRowChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableColumnImpl implements _TableColumn {
  _$TableColumnImpl(
      {required this.title,
      required this.enableRowChecked,
      required this.type});

  factory _$TableColumnImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableColumnImplFromJson(json);

  @override
  final String title;
  @override
  final bool enableRowChecked;
  @override
  final dynamic type;

  @override
  String toString() {
    return 'TableColumn(title: $title, enableRowChecked: $enableRowChecked, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableColumnImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.enableRowChecked, enableRowChecked) ||
                other.enableRowChecked == enableRowChecked) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, enableRowChecked,
      const DeepCollectionEquality().hash(type));

  /// Create a copy of TableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableColumnImplCopyWith<_$TableColumnImpl> get copyWith =>
      __$$TableColumnImplCopyWithImpl<_$TableColumnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableColumnImplToJson(
      this,
    );
  }
}

abstract class _TableColumn implements TableColumn {
  factory _TableColumn(
      {required final String title,
      required final bool enableRowChecked,
      required final dynamic type}) = _$TableColumnImpl;

  factory _TableColumn.fromJson(Map<String, dynamic> json) =
      _$TableColumnImpl.fromJson;

  @override
  String get title;
  @override
  bool get enableRowChecked;
  @override
  dynamic get type;

  /// Create a copy of TableColumn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableColumnImplCopyWith<_$TableColumnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
