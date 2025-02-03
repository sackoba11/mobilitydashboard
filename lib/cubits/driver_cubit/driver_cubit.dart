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
      driversData =
          (await stationRepository.getAllDrivers()).fold((l) => [], (r) => r);
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
    // int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<Driver> query = await getAllRemoteDrivers();

    if (email != null) {
      query = query.where((element) => element.email.toLowerCase() == email.toLowerCase());
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

    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Driver lastDriver = resultSet.removeLast();
      nextPageToken = lastDriver.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
