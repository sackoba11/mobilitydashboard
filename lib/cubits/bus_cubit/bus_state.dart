import 'package:equatable/equatable.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus.dart';

sealed class BusState extends Equatable {}

class BusInitialState extends BusState {
  @override
  List<Object?> get props => [];
}

class BusLoading extends BusState {
  @override
  List<Object?> get props => [];
}

class BusLoadingFailure extends BusState {
  BusLoadingFailure({
    required this.error,
  });

  final AppError error;
  @override
  List<Object?> get props => [error];
}

class BusLoaded extends BusState {
  BusLoaded({
    required this.listBus,
  });

  final List<Bus> listBus;
  @override
  List<Object?> get props => [listBus];
}
