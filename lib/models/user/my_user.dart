import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@freezed
class MyUser with _$MyUser {
  factory MyUser({
    int? id,
    required String uid,
    required String name,
    required String email,
  }) = _MyUser;
  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
