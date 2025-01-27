import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_row.freezed.dart';
part 'table_row.g.dart';

@freezed
abstract class TableRow with _$TableRow {
  factory TableRow({required Map<String, dynamic> cells}) = _TableRow;
  factory TableRow.fromJson(Map<String, dynamic> json) =>
      _$TableRowFromJson(json);
}
