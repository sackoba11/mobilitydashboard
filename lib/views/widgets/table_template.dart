import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../responsive.dart';

class TableTemplate<K, T> extends StatelessWidget {
  final String title;
  final List<ReadOnlyTableColumn<String, T>> columns;
  final List<TableFilter<Object>> filters;
  final Widget filterBarChild;

  final FutureOr<(List<T>, String?)> Function(
      int, SortModel?, FilterModel, String?) fetcher;
  const TableTemplate(
      {super.key,
      required this.columns,
      required this.filters,
      required this.filterBarChild,
      required this.title,
      required this.fetcher});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, T>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: context.colors.secondary,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        hintText: 'Recherche',
                      ),
                    ),
                  ),
                ),
              if (Responsive.isMobile(context))
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          context.gaps.small,
          Expanded(
            child: PagedDataTableTheme(
                data: PagedDataTableThemeData(
                  borderRadius: BorderRadius.circular(8.sp),
                  elevation: 2,
                  headerTextStyle: TextStyle(color: context.colors.white),
                  cellTextStyle: TextStyle(color: context.colors.white),
                  backgroundColor: context.colors.secondary,
                  selectedRow: context.colors.lightPrimary,
                  rowColor: (index) => context.colors.secondary,
                ),
                child: PagedDataTable<String, T>(
                    controller: tableController,
                    initialPageSize: 40,
                    configuration: const PagedDataTableConfiguration(),
                    pageSizes: const [5, 10, 20, 40],
                    fetcher: fetcher,
                    columns: [
                      RowSelectorColumn(),
                      TableColumn(
                        title: const Text("Index"),
                        cellBuilder: (context, item, index) =>
                            Text(index.toString()),
                      ),
                      for (var column in columns) column,
                    ],
                    filters: [for (var filter in filters) filter],
                    filterBarChild: filterBarChild)),
          ),
        ],
      ),
    );
  }
}
