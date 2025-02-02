import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/user/my_user.dart';
import '../../repositories/driver_repository/driver_repository_impl.dart';
import '../../repositories/driver_repository/i_driver_repository.dart';
import 'driver_state.dart';

@Singleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  List<MyUser> usersData = [];
  IDriverRepository driverRepository = DriverRepositoryImpl();

  Future<List<MyUser>> getAllUsers() async {
    try {
      emit(UserLoading());

      usersData =
          (await driverRepository.getAllUsers()).fold((l) => [], (r) => r);
      emit(UserLoaded(listUsers: usersData));
      return usersData;
    } catch (e) {
      print(e);
      emit(UserLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }
}
