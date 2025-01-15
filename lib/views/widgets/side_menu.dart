import 'package:flutter/material.dart';

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
                      onTap: () {},
                    ))
              .toList(),
        ),
      ],
    );
  }
}
