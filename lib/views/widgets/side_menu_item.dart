import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilitydashboard/cubits/side_menu_cubit/side_menu_state.dart';

import '../../core/routes/routes.dart';
import '../../cubits/side_menu_cubit/side_menu_cubit.dart';
import '../../di.dart';

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

    return BlocBuilder<SideMenuCubit, SideMenuCubitState>(
      buildWhen: (context, state) {
        return state is SideMenuChangedToState;
      },
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width ?? mediaQueryWidth / 7.6,
                decoration: BoxDecoration(
                    color: locator.get<SideMenuCubit>().isActive(itemName)
                        ? Colors.red
                        : null,
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(itemName.name!,
                    style: TextStyle(
                        // color: context.colors.black,
                        fontSize: fontSize ?? 20,
                        fontWeight: bold ? FontWeight.bold : null)),
              )
            ],
          ),
        );
      },
    );
  }
}
