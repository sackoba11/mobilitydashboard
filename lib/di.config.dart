// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/theme/color/default_app_color.dart' as _i763;
import 'core/theme/color/i_app_color.dart' as _i260;
import 'cubits/bus_cubit/bus_cubit.dart' as _i423;
import 'cubits/driver_cubit/driver_cubit.dart' as _i358;
import 'cubits/side_menu_cubit/side_menu_cubit.dart' as _i180;
import 'cubits/station_cubit/station_cubit.dart' as _i1046;
import 'cubits/users_cubit/user_cubit.dart' as _i265;
import 'repositories/auth_repositiry/auth_repository_impl.dart' as _i505;
import 'repositories/auth_repositiry/i_auth_repository.dart' as _i872;
import 'repositories/bus_repository/bus_repository_impl.dart' as _i25;
import 'repositories/bus_repository/i_bus_repository.dart' as _i569;
import 'repositories/driver_repository/driver_repository_impl.dart' as _i961;
import 'repositories/driver_repository/i_driver_repository.dart' as _i376;
import 'repositories/station_repository/i_station_repository.dart' as _i342;
import 'repositories/station_repository/station_repository_impl.dart' as _i760;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i423.BusCubit>(() => _i423.BusCubit());
    gh.singleton<_i180.SideMenuCubit>(() => _i180.SideMenuCubit());
    gh.singleton<_i1046.StationCubit>(() => _i1046.StationCubit());
    gh.singleton<_i358.DriverCubit>(() => _i358.DriverCubit());
    gh.singleton<_i265.UserCubit>(() => _i265.UserCubit());
    gh.lazySingleton<_i569.IBusRepository>(() => _i25.BusRepositoryImpl());
    gh.lazySingleton<_i376.IDriverRepository>(
        () => _i961.DriverRepositoryImpl());
    gh.singleton<_i260.IAppColor>(() => _i763.DefaultAppColor());
    gh.lazySingleton<_i872.IAuthRepository>(() => _i505.AuthRepositoryImpl());
    gh.lazySingleton<_i342.IStationRepository>(
        () => _i760.StationRepositoryImpl());
    return this;
  }
}
