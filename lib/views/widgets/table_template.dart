import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

class TableTemplate<K, T> extends StatelessWidget {
  final String title;
  final List<ReadOnlyTableColumn<String, T>> columns;
  final List<TableFilter<Object>> filters;
  final Widget filterBarChild;
  final List<T> data;
  const TableTemplate(
      {super.key,
      required this.columns,
      required this.data,
      required this.filters,
      required this.filterBarChild,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, T>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    fetcher:
                        (pageSize, sortModel, filterModel, pageToken) async {
                      return (data, null);
                    },
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
