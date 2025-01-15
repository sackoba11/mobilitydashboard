import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/animations/fade_animation.dart';
import 'core/routes/routes.dart';
import 'dashboard.dart';
import 'views/screens/bus/bus_screen.dart';
import 'views/screens/driver/driver_screen.dart';
import 'views/screens/home/home_screen.dart';
import 'views/screens/station/station_screen.dart';
import 'views/screens/users/users_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _goRouterKey = GlobalKey();

  static GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _goRouterKey,
      initialLocation: AppRoutes.homeScreen.path,
      routes: [
        StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navigationShell) =>
                FadeTransitionPage(
                    key: state.pageKey,
                    child: Dashboard(statefulNavigationShell: navigationShell)),
            branches: [
              StatefulShellBranch(routes: [
                GoRoute(
                    path: AppRoutes.homeScreen.path,
                    builder: (context, state) => const HomeScreen()),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    path: AppRoutes.busScreen.path,
                    builder: (context, state) => const BusScreen()),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    path: AppRoutes.driverScreen.path,
                    builder: (context, state) => const DriverScreen()),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    path: AppRoutes.usersScreen.path,
                    builder: (context, state) => const UsersScreen()),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    path: AppRoutes.stationnScreen.path,
                    builder: (context, state) => const StationScreen()),
              ]),
            ])
      ]);
}
