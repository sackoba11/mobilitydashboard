import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../core/assets/assets.gen.dart';

class FilterPopupMenuButtonAction extends StatelessWidget {
  final PagedDataTableController<String, dynamic> tableController;
  final Function()? onPressed;

  const FilterPopupMenuButtonAction(
      {super.key, required this.tableController, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Ajouter',
          onPressed: onPressed,
          icon: Assets.svg.addRow.svg(
              color: context.colors.textColor, height: 35.sp, width: 35.sp),
        ),
        PopupMenuButton(
          tooltip: 'Menu',
          icon: Assets.svg.menuVertical1.svg(
              color: context.colors.textColor, height: 30.sp, width: 30.sp),
          itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: const Text(
                "Print selected rows",
              ),
              onTap: () {
                debugPrint(tableController.selectedRows.toString());
                debugPrint(tableController.selectedItems.toString());
              },
            ),
            PopupMenuItem(
              child: const Text("Select random row"),
              onTap: () {
                final index = Random().nextInt(tableController.totalItems);
                tableController.selectRow(index);
              },
            ),
            PopupMenuItem(
              child: const Text("Select all rows"),
              onTap: () {
                tableController.selectAllRows();
              },
            ),
            PopupMenuItem(
              child: const Text("Unselect all rows"),
              onTap: () {
                tableController.unselectAllRows();
              },
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              child: const Text("Remove first row"),
              onTap: () {
                // tableController.refresh();
                tableController.removeRowAt(0);
              },
            ),
            PopupMenuItem(
              child: const Text("Remove last row"),
              onTap: () {
                tableController.removeRowAt(tableController.totalItems - 1);
              },
            ),
            PopupMenuItem(
              child: const Text("Remove random row"),
              onTap: () {
                final index = Random().nextInt(tableController.totalItems);
                tableController.removeRowAt(index);
              },
            ),
          ],
        ),
      ],
    );
  }
}
