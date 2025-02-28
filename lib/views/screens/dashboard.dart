import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

import '../../responsive.dart';
import '../widgets/side_menu.dart';

class Dashboard extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;
  Dashboard({super.key, required this.statefulNavigationShell});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.background,
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
                backgroundColor: context.colors.background,
              )
            : null,
        key: _scaffoldKey,
        drawer: !Responsive.isDesktop(context)
            ? Drawer(
                backgroundColor: context.colors.background,
                width: 400.sp,
                child: SideMenu(scaffoldKey: _scaffoldKey))
            : null,
        body: SafeArea(
            child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SideMenu(
                    scaffoldKey: _scaffoldKey,
                  ),
                ),
              ),
            Expanded(flex: 8, child: statefulNavigationShell),
          ],
        )));
  }
}
