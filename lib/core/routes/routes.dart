enum AppRoutes {
initialScreen(path: '/', name: null),
  homeScreen(path: '/home', name: 'Overview'),
  busScreen(path: '/bus', name: 'Bus'),
  driverScreen(path: '/drivers', name: 'Drivers Bus'),
  usersScreen(path: '/users', name: 'Users'),
  stationnScreen(path: '/stations', name: 'Stations');

  const AppRoutes({required this.path, required this.name});
  final String path;
  final String? name;
}
