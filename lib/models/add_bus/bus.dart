import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
class AddBus with _$AddBus {
  factory AddBus(
      {
      required int number,
      required String source,
      required String destination,
      required bool isActive,
      required Map<String, dynamic> roadMap,
     }) = _AddBus;
  factory AddBus.fromJson(Map<String, dynamic> json) => _$AddBusFromJson(json);
}
