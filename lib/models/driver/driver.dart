import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
class Driver with _$Driver {
  factory Driver(
      {required String name,
      required String number,
      required String email,
      }) = _Driver;
  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}
