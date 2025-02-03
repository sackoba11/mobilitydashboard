import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/bus/bus.dart';
import '../../repositories/bus_repository/bus_repository_impl.dart';
import '../../repositories/bus_repository/i_bus_repository.dart';
import '../../views/widgets/paginated_list.dart';
import 'bus_state.dart';

@Singleton()
class BusCubit extends Cubit<BusState> {
  BusCubit() : super(BusInitialState());
  List<Bus> busData = [];
  IBusRepository busRepository = BusRepositoryImpl();

  Future<List<Bus>> getAllRemoteBus() async {
    try {
      emit(BusLoading());

      List<Bus> listAllBus =
          (await busRepository.getAllBus()).fold((l) => [], (r) => r);
      busData = listAllBus;
      return listAllBus;
    } catch (e) {
      print(e);
      emit(BusLoadingFailure(
          error: GenericAppError('Echec de chargement des bus, Erreur: $e')));
      return [];
    }
  }

  Future<PaginatedList<Bus>> getAllBusPaginated({
    required int pageSize,
    required String? pageToken,
    bool? active,
    String? busNumber,
    String? searchQuery,
  }) async {
    // int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<Bus> query = await getAllRemoteBus();

    if (active != null) {
      query = query.where((element) => element.isActive == active);
    }
    if (busNumber != null) {
      query = query.where((element) => element.number.toString() == busNumber);
    }
    if (searchQuery != null) {
      searchQuery = searchQuery.toLowerCase();
      query = query.where((element) =>
          element.source.toLowerCase().contains(searchQuery!) ||
          element.destination.toLowerCase().contains(searchQuery));
    }

    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Bus lastBus = resultSet.removeLast();
      nextPageToken = lastBus.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
