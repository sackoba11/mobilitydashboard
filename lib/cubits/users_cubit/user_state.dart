import 'package:equatable/equatable.dart';

import '../../error/app_error.dart';
import '../../models/user/my_user.dart';

sealed class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingFailure extends UserState {
  UserLoadingFailure({
    required this.error,
  });

  final AppError error;
  @override
  List<Object?> get props => [error];
}

class UserLoaded extends UserState {
  UserLoaded({
    required this.listUsers,
  });

  final List<MyUser> listUsers;
  @override
  List<Object?> get props => [listUsers];
}
