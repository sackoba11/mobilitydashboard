import 'package:flutter/material.dart';
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            tooltip: 'Supprimer',
            onPressed: () {
              final rows = tableController.selectedRows;
              for (var index in rows) {
                tableController.removeRowAt(index);
              }
              tableController.unselectAllRows();
            },
            icon: Assets.svg.deleteButton
                .svg(color: context.colors.red, height: 20, width: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            tooltip: 'Ajouter',
            onPressed: onPressed,
            icon: Assets.svg.addRow
                .svg(color: context.colors.textColor, height: 35, width: 35),
          ),
        ),
      ],
    );
  }
}
