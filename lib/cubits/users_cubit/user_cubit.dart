import 'package:darq/darq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilitydashboard/error/app_error.dart';

import '../../models/user/my_user.dart';
import '../../repositories/driver_repository/driver_repository_impl.dart';
import '../../repositories/driver_repository/i_driver_repository.dart';
import '../../views/widgets/paginated_list.dart';
import 'user_state.dart';

@Singleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  static List<MyUser> usersData = [];
  IDriverRepository driverRepository = DriverRepositoryImpl();

  Future<List<MyUser>> getAllRemoteUsers() async {
    try {
      emit(UserLoading());

      List<MyUser> usersDatas =
          (await driverRepository.getAllUsers()).fold((l) => [], (r) => r);
      usersData = List.generate(
          usersDatas.length,
          (index) => MyUser(
              id: index,
              uid: usersDatas[index].uid,
              name: usersDatas[index].name,
              email: usersDatas[index].email));
      emit(UserLoaded(listUsers: usersData));
      return usersData;
    } catch (e) {
      print(e);
      emit(UserLoadingFailure(
          error: GenericAppError('Echec de chargement des gares, Erreur: $e')));
      return [];
    }
  }

  Future<PaginatedList<MyUser>> getAllUsersPaginated({
    required int pageSize,
    required String? pageToken,
    String? email,
    String? searchQuery,
  }) async {
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<MyUser> query;

    if (usersData.isEmpty) {
      query = await getAllRemoteUsers();
    } else {
      query = usersData;
    }
    query = query.orderBy((element) => element.id);
    if (email != null) {
      query = query.where(
          (element) => element.email.toLowerCase() == email.toLowerCase());
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
      MyUser lastUser = resultSet.removeLast();
      nextPageToken = lastUser.id.toString();
    }
    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}
