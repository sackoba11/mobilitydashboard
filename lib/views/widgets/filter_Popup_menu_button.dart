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
        if (tableController.selectedRows.isEmpty)
          InkWell(
            child: Text('supprimer'),
            onTap: () {
              tableController.selectRow(0);
              print(tableController.selectedRows);
            },
            // icon: Icon(Icons.delete_outline, color: context.colors.red),
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
