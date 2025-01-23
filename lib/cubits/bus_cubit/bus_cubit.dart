import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/bus/bus.dart';
import '../../repositories/BusRepository/bus_repository_impl.dart';
import '../../repositories/BusRepository/i_bus_repository.dart';
import 'bus_state.dart';

@Singleton()
class BusCubit extends Cubit<BusState> {
  BusCubit() : super(BusInitialState());
  List<Bus> busData = [];
  IBusRepository busRepository = BusRepositoryImpl();

  void getAllBus() async {
    try {
      emit(BusLoading());
      // List<Bus> activeBusList =
      //     (await busRepository.getActiveBus()).fold((l) => [], (r) => r);

      List<Bus> listAllBus =
          (await busRepository.getAllBus()).fold((l) => [], (r) => r);

      var availableActiveBusList = listAllBus;
      // print(availableActiveBusList);
      emit(BusLoaded(listBus: availableActiveBusList));
    } catch (e) {
      print(e);
      emit(BusLoadingFailure(
          error: GenericAppError('Echec de chargement des bus, Erreur: $e')));
    }
  }
}
