import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';

class SideMenuItem extends StatelessWidget {
  final AppRoutes itemName;
  final double? fontSize;
  final double? width;
  final bool bold;
  final GestureTapCallback onTap;
  const SideMenuItem(
      {super.key,
      required this.itemName,
      required this.onTap,
      this.fontSize,
      this.width,
      this.bold = false});

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width ?? mediaQueryWidth / 7.6,
            decoration: BoxDecoration(
                // color: customSideMenuController.isActive(itemName)
                //     ? context.colors.sideBarItemBackground
                //     : null,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(itemName.name!,
                style: TextStyle(
                    // color: context.colors.black,
                    fontSize: fontSize ?? 20,
                    fontWeight: bold ? FontWeight.bold : null)),
          )
        ],
      ),
    );
  }
}
