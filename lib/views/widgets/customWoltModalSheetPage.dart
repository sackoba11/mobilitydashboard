import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/views/widgets/dynamic_form_fields.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

Future<dynamic> customWoltModalSheetPage(
    {required BuildContext context,
    required String title,
    required List<Widget> columns,
    required Function() onTap,
    bool isBus = false,
    TextEditingController? roadMapTextEditingController,
    required PagedDataTableController<String, dynamic> tableController}) {
  return WoltModalSheet.show(
    barrierDismissible: false,
    context: context,
    pageListBuilder: (bottomSheetContext) => [
      WoltModalSheetPage(
          topBarTitle: Center(
              child: Text(
            title,
            style: TextStyle(color: context.colors.textColor),
          )),
          pageTitle: Center(child: Text(title)),
          backgroundColor: context.colors.secondary,
          trailingNavBarWidget: IconButton(
            tooltip: 'Fermer',
            padding: const EdgeInsets.all(8),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(bottomSheetContext).pop,
          ),
          child: DynamicFormFields(
            columns: columns,
            isBus: isBus,
            onTap: onTap,
          )),
    ],
  );
}
