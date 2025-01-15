import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilitydashboard/cubits/side_menu_cubit/side_menu_cubit.dart';
import 'package:mobilitydashboard/di.dart';

import '../../core/routes/routes.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: AppRoutes.values
              .map((item) => item.name == null
                  ? const SizedBox()
                  : SideMenuItem(
                      bold: true,
                      itemName: item,
                      onTap: () {
                        if (!locator.get<SideMenuCubit>().isActive(item)) {
                          locator.get<SideMenuCubit>().changeActiveItemTo(item);
                          context.go(item.path);
                        }
                      },
                    ))
              .toList(),
        ),
      ],
    );
  }
}
