import 'package:darq/darq.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/add_bus/bus.dart';
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

  Future<bool> addBus({required Bus data}) async {
    try {
      var result =
          (await busRepository.addBus(data: data)).fold((l) => false, (r) => r);
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Bus>> getAllRemoteBus() async {
    try {
      emit(BusLoading());

      busData = (await busRepository.getAllBus()).fold((l) => [], (r) => r);
      return busData;
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
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<Bus> query;
    if (busData.isEmpty) {
      query = await getAllRemoteBus();
    } else {
      query = busData;
    }
    query = List.generate(
        busData.length,
        (index) => Bus(
              id: index,
              number: busData[index].number,
              source: busData[index].source,
              destination: busData[index].destination,
              isActive: busData[index].isActive,
              roadMap: busData[index].roadMap,
            ));

    query = query.orderBy((element) => element.id);
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
    query = query.where((element) => element.id! >= nextId);

    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Bus lastBus = resultSet.removeLast();
      nextPageToken = lastBus.id.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
