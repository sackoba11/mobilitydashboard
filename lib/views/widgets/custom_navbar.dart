import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

import '../../core/assets/assets.gen.dart';
import '../../responsive.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {super.key,
      required this.title,
      re,
      required this.textEditingController});

  final String title;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // if (!Responsive.isMobile(context))
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 35,
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.colors.secondary,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(
                    color: context.colors.primary,
                  ),
                ),
                prefixIcon: const Icon(Icons.search, size: 18),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                hintText: 'Recherche',
              ),
            ),
          ),
        ),
        context.gaps.normal,

        IconButton(
          tooltip: 'Se deconnecter',
          splashRadius: 2.sp,
          onPressed: () {},
          padding: const EdgeInsets.symmetric(horizontal: 8),
          icon: Row(
            children: [
              Assets.svg.logout1
                  .svg(color: context.colors.textColor, height: 20, width: 20),
              context.gaps.small,
              if (!Responsive.isMobile(context))
                Text(
                  'Se deconnecter',
                  style: TextStyle(color: context.colors.textColor),
                )
            ],
          ),
        ),
      ],
    );
  }
}
