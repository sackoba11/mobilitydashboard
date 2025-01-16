import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/cubits/side_menu_cubit/side_menu_state.dart';

import '../../core/assets/assets.gen.dart';
import '../../core/routes/routes.dart';
import '../../cubits/side_menu_cubit/side_menu_cubit.dart';
import '../../di.dart';

class SideMenuItem extends StatelessWidget {
  final AppRoutes itemName;
  final GestureTapCallback onTap;
  const SideMenuItem({
    super.key,
    required this.itemName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideMenuCubit, SideMenuCubitState>(
      buildWhen: (context, state) {
        return state is SideMenuChangedToState;
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 5.sp),
          decoration: BoxDecoration(
              color: locator.get<SideMenuCubit>().isActive(itemName)
                  ? context.colors.primary
                  : null,
              borderRadius: BorderRadius.circular(6.sp)),
          child: InkWell(
            borderRadius: BorderRadius.circular(6.sp),
            onTap: onTap,
            child: Row(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    child: Assets.svg.home.svg(
                      color: locator.get<SideMenuCubit>().isActive(itemName)
                          ? context.colors.black
                          : context.colors.textColor,
                    )),
                Text(itemName.name!,
                    style: TextStyle(
                        color: locator.get<SideMenuCubit>().isActive(itemName)
                            ? context.colors.black
                            : context.colors.textColor,
                        fontSize: 16,
                        fontWeight:
                            locator.get<SideMenuCubit>().isActive(itemName)
                                ? FontWeight.w600
                                : FontWeight.normal))
              ],
            ),
          ),
        );
      },
    );
  }
}
