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
import 'cubits/side_menu_cubit/side_menu_cubit.dart' as _i180;
import 'repositories/authRepositiry/auth_repository_impl.dart' as _i25;
import 'repositories/authRepositiry/i_auth_repository.dart' as _i1037;
import 'repositories/BusRepository/bus_repository_impl.dart' as _i920;
import 'repositories/BusRepository/i_bus_repository.dart' as _i455;
import 'repositories/driverRepository/driver_repository_impl.dart' as _i950;
import 'repositories/driverRepository/i_driver_repository.dart' as _i726;
import 'repositories/OtherCarRepository/i_other_car_repository.dart' as _i559;
import 'repositories/OtherCarRepository/other_car_repository_impl.dart'
    as _i545;

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
    gh.singleton<_i260.IAppColor>(() => _i763.DefaultAppColor());
    gh.lazySingleton<_i726.IDriverRepository>(
        () => _i950.DriverRepositoryImpl());
    gh.lazySingleton<_i1037.IAuthRepository>(() => _i25.AuthRepositoryImpl());
    gh.lazySingleton<_i455.IBusRepository>(() => _i920.BusRepositoryImpl());
    gh.lazySingleton<_i559.IOtherCarRepository>(
        () => _i545.OtherCarRepositoryImpl());
    return this;
  }
}
