import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/gare/gare.dart';
import '../../repositories/station_repository/i_station_repository.dart';
import '../../repositories/station_repository/station_repository_impl.dart';
import 'station_state.dart';

@Singleton()
class StationCubit extends Cubit<StationState> {
  StationCubit() : super(StationInitialState());
  List<Gare> stationData = [];
  IStationRepository driverRepository = StationRepositoryImpl();

  Future<List<Gare>> getAllBus() async {
    try {
      emit(StationLoading());

      stationData =
          (await driverRepository.getAllGares()).fold((l) => [], (r) => r);

      emit(StationLoaded(listStation: stationData));
      return stationData;
    } catch (e) {
      print(e);
      emit(StationLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }
}
