import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../models/bus/bus_from_firestore/bus.dart';

PopupMenuButton<dynamic> filterPopupMenuButtom(
    PagedDataTableController<String, Bus> tableController) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert_outlined,
    ),
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
  );
}
