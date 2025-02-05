import 'package:darq/darq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/gare/gare.dart';
import '../../repositories/station_repository/i_station_repository.dart';
import '../../repositories/station_repository/station_repository_impl.dart';
import '../../views/widgets/paginated_list.dart';
import 'station_state.dart';

@Singleton()
class StationCubit extends Cubit<StationState> {
  StationCubit() : super(StationInitialState());
  List<Gare> stationData = [];
  IStationRepository driverRepository = StationRepositoryImpl();

  Future<List<Gare>> getAllRemoteStations() async {
    try {
      emit(StationLoading());

      List<Gare> stationDatas =
          (await driverRepository.getAllGares()).fold((l) => [], (r) => r);

      stationData = List.generate(
          stationDatas.length,
          (index) => Gare(
              id: index,
              name: stationDatas[index].name,
              commune: stationDatas[index].commune,
              type: stationDatas[index].type,
              location: stationDatas[index].location));

      emit(StationLoaded(listStation: stationData));
      return stationData;
    } catch (e) {
      print(e);
      emit(StationLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }

  Future<PaginatedList<Gare>> getAllStationPaginated({
    required int pageSize,
    required String? pageToken,
    String? type,
    String? commune,
    String? searchQuery,
  }) async {
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<Gare> query;
    if (stationData.isEmpty) {
      query = await getAllRemoteStations();
    } else {
      query = stationData;
    }
    query = query.orderBy((element) => element.id);

    if (type != null) {
      query = query.where((element) => element.type == type);
    }
    if (commune != null) {
      query = query.where(
          (element) => element.commune.toLowerCase() == commune.toLowerCase());
    }
    if (searchQuery != null) {
      searchQuery = searchQuery.toLowerCase();
      query = query.where((element) =>
          element.name.toLowerCase().contains(searchQuery!) ||
          element.commune.toLowerCase().contains(searchQuery));
    }

    query = query.where((element) => element.id! >= nextId);

    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Gare lastStation = resultSet.removeLast();
      nextPageToken = lastStation.id.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
