import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../core/routes/routes.dart';
import 'side_menu_state.dart';

@singleton
class SideMenuCubit extends Cubit<SideMenuCubitState> {
  SideMenuCubit() : super(SideMenuCubitInitial());

  var activeItem = AppRoutes.homeScreen;

  changeActiveItemTo(AppRoutes itemName) {
    emit(SideMenuChangedToState(item: itemName));
    activeItem = itemName;
  }

  bool isActive(AppRoutes itemName) {
    if (activeItem == itemName) {
      emit(SideMenuChangedToState(item: AppRoutes.initialScreen ));
      return true;
    } else {
      return false;
    }
  }
}
