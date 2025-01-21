enum AppRoutes {
  initialScreen(path: '/', name: null, icon: null),
  homeScreen(
    path: '/home',
    name: 'Accueil',
    icon: 'assets/svg/dashboard2.svg',
  ),
  busScreen(
    path: '/bus',
    name: 'Bus',
    icon: 'assets/svg/bus1.svg',
  ),
  driverScreen(
    path: '/drivers',
    name: 'Conducteurs Bus',
    icon: 'assets/svg/chauffer.svg',
  ),
  usersScreen(
    path: '/users',
    name: 'Uitlisateurs',
    icon: 'assets/svg/users-user.svg',
  ),
  stationnScreen(
    path: '/stations',
    name: 'Gares',
    icon: 'assets/svg/bus-stop-pointer.svg',
  );

  const AppRoutes({
    required this.path,
    required this.name,
    required this.icon,
  });
  final String path;
  final String? name;
  final String? icon;
}
