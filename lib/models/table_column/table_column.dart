import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_column.freezed.dart';
part 'table_column.g.dart';

@freezed
abstract class TableColumn with _$TableColumn {
  factory TableColumn({
    required String title,
    required bool enableRowChecked,
    required dynamic type,
  }) = _TableColumn;
  factory TableColumn.fromJson(Map<String, dynamic> json) =>
      _$TableColumnFromJson(json);
}
