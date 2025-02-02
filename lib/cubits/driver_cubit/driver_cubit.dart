import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/driver/driver.dart';
import '../../repositories/driver_repository/driver_repository_impl.dart';
import '../../repositories/driver_repository/i_driver_repository.dart';
import 'driver_state.dart';

@Singleton()
class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitialState());
  List<Driver> driversData = [];
  IDriverRepository stationRepository = DriverRepositoryImpl();

  Future<List<Driver>> getAllDrivers() async {
    try {
      emit(DriverLoading());

      driversData =
          (await stationRepository.getAllDrivers()).fold((l) => [], (r) => r);
      print(driversData);
      emit(DriverLoaded(listStation: driversData));
      return driversData;
    } catch (e) {
      print(e);
      emit(DriverLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }
}
