import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

class TableTemplate<K, T> extends StatelessWidget {
  final List<ReadOnlyTableColumn<String, T>> columns;
  final List<TableFilter<Object>> filters;
  final Widget filterBarChild;
  final PagedDataTableController<String, T> tableController;

  final FutureOr<(List<T>, String?)> Function(
      int, SortModel?, FilterModel, String?) fetcher;
  const TableTemplate(
      {super.key,
      required this.columns,
      required this.filters,
      required this.filterBarChild,
      required this.fetcher,
      required this.tableController});

  @override
  Widget build(BuildContext context) {
    return PagedDataTableTheme(
        data: PagedDataTableThemeData(
          filterBarHeight: 60,
          borderRadius: BorderRadius.circular(8.sp),
          elevation: 2,
          headerTextStyle: TextStyle(
            color: context.colors.white,
          ),
          cellTextStyle: TextStyle(color: context.colors.white),
          backgroundColor: context.colors.secondary,
          selectedRow: context.colors.lightPrimary,
          rowColor: (index) => context.colors.secondary,
        ),
        child: PagedDataTable<String, T>(
            controller: tableController,
            initialPageSize: 10,
            pageSizes: const [5, 10, 20, 50, 70, 100, 150],
            fetcher: fetcher,
            columns: [
              RowSelectorColumn(),
              TableColumn(
                title: const Text("Index"),
                cellBuilder: (context, item, index) => Text('${index + 1}'),
              ),
              for (var column in columns) column,
            ],
            filters: [for (var filter in filters) filter],
            filterBarChild: filterBarChild));
  }
}
