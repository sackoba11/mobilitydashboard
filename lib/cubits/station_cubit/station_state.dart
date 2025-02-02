import 'package:equatable/equatable.dart';

import '../../error/app_error.dart';
import '../../models/gare/gare.dart';

sealed class StationState extends Equatable {}

class StationInitialState extends StationState {
  @override
  List<Object?> get props => [];
}

class StationLoading extends StationState {
  @override
  List<Object?> get props => [];
}

class StationLoadingFailure extends StationState {
  StationLoadingFailure({
    required this.error,
  });

  final AppError error;
  @override
  List<Object?> get props => [error];
}

class StationLoaded extends StationState {
  StationLoaded({
    required this.listStation,
  });

  final List<Gare> listStation;
  @override
  List<Object?> get props => [listStation];
}
