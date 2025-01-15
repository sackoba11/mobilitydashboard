import 'package:equatable/equatable.dart';

import '../../core/routes/routes.dart';

sealed class SideMenuCubitState extends Equatable {}

class SideMenuCubitInitial extends SideMenuCubitState {
  @override
  List<Object?> get props => [];
}

class SideMenuChangedToState extends SideMenuCubitState {
  final AppRoutes item;

  SideMenuChangedToState({required this.item});

  @override
  List<Object?> get props => [item];
}
