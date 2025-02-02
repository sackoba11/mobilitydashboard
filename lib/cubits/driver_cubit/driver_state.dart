import 'package:equatable/equatable.dart';

import '../../error/app_error.dart';
import '../../models/driver/driver.dart';

sealed class DriverState extends Equatable {}

class DriverInitialState extends DriverState {
  @override
  List<Object?> get props => [];
}

class DriverLoading extends DriverState {
  @override
  List<Object?> get props => [];
}

class DriverLoadingFailure extends DriverState {
  DriverLoadingFailure({
    required this.error,
  });

  final AppError error;
  @override
  List<Object?> get props => [error];
}

class DriverLoaded extends DriverState {
  DriverLoaded({
    required this.listStation,
  });

  final List<Driver> listStation;
  @override
  List<Object?> get props => [listStation];
}
