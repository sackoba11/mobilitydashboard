import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'views/widgets/side_menu.dart';

class Dashboard extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const Dashboard({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
        ),
        Expanded(flex: 8, child: statefulNavigationShell),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ],
    )));
  }
}
