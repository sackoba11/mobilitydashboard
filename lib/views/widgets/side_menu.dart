import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilitydashboard/cubits/side_menu_cubit/side_menu_cubit.dart';
import 'package:mobilitydashboard/di.dart';

import '../../core/routes/routes.dart';
import '../../responsive.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = MediaQuery.sizeOf(context).width;

    return Container(
      width: mediaQueryWidth,
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(
          color: Colors.grey[800]!,
          width: 1,
        ),
      )),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 40 : 80,
            ),
            for (var item in AppRoutes.values)
              item.name == null
                  ? const SizedBox()
                  : SideMenuItem(
                      itemName: item,
                      onTap: () {
                        if (!locator.get<SideMenuCubit>().isActive(item)) {
                          locator.get<SideMenuCubit>().changeActiveItemTo(item);
                          context.go(item.path);
                        }
                      },
                    )
          ]),
        ),
      ),
    );
  }
}
