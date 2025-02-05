import 'package:darq/darq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/driver/driver.dart';
import '../../repositories/driver_repository/driver_repository_impl.dart';
import '../../repositories/driver_repository/i_driver_repository.dart';
import '../../views/widgets/paginated_list.dart';
import 'driver_state.dart';

@Singleton()
class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitialState());
  List<Driver> driversData = [];
  IDriverRepository stationRepository = DriverRepositoryImpl();

  Future<List<Driver>> getAllRemoteDrivers() async {
    try {
      emit(DriverLoading());
      List<Driver> driversDatas =
          (await stationRepository.getAllDrivers()).fold((l) => [], (r) => r);
      driversData = List.generate(
          driversDatas.length,
          (index) => Driver(
              id: index,
              name: driversDatas[index].name,
              number: driversDatas[index].number,
              email: driversDatas[index].email));
      emit(DriverLoaded(listStation: driversData));
      return driversData;
    } catch (e) {
      print(e);
      emit(DriverLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }

  Future<PaginatedList<Driver>> getAllDriverPaginated({
    required int pageSize,
    required String? pageToken,
    String? email,
    String? driverNumber,
    String? searchQuery,
  }) async {
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<Driver> query = await getAllRemoteDrivers();
    if (driversData.isEmpty) {
      query = await getAllRemoteDrivers();
    } else {
      query = driversData;
    }

    query = query.orderBy((element) => element.id);

    if (email != null) {
      query = query.where(
          (element) => element.email.toLowerCase() == email.toLowerCase());
    }
    if (driverNumber != null) {
      query = query.where((element) => element.number == driverNumber);
    }
    if (searchQuery != null) {
      searchQuery = searchQuery.toLowerCase();
      query = query.where((element) =>
          element.name.toLowerCase().contains(searchQuery!) ||
          element.email.toLowerCase().contains(searchQuery));
    }
    query = query.where((element) => element.id! >= nextId);
    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Driver lastDriver = resultSet.removeLast();
      nextPageToken = lastDriver.id.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
