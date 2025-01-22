import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/bus_cubit/bus_cubit.dart';
import 'cubits/side_menu_cubit/side_menu_cubit.dart';
import 'di.dart';

class Providers extends StatelessWidget {
  final Widget child;
  const Providers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => locator.get<SideMenuCubit>()),
      BlocProvider(
        create: (_) => locator.get<BusCubit>(),
      )
    ], child: child);
  }
}
