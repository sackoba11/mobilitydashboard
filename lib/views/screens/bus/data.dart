import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import 'repo.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final tableController = PagedDataTableController<String, Post>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.colors.background,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PagedDataTableTheme(
                data: PagedDataTableThemeData(
                  headerTextStyle: TextStyle(color: context.colors.white),
                  cellTextStyle: TextStyle(color: context.colors.white),
                  backgroundColor: Colors.transparent,
                  selectedRow: context.colors.gray,
                  rowColor: (index) => index.isEven ? Colors.purple[50] : null,
                ),
                child: PagedDataTable<String, Post>(
                  controller: tableController,
                  initialPageSize: 20,
                  configuration: const PagedDataTableConfiguration(),
                  pageSizes: const [10, 20, 50, 100],
                  fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                    final data = List.generate(40, (index) {
                      return Post(
                          id: index,
                          author: 'author',
                          content: 'content',
                          createdAt: DateTime.now(),
                          isEnabled: index % 2 == 0 ? true : false,
                          number: 2,
                          authorGender:
                              index % 2 == 0 ? Gender.female : Gender.male);
                    });

                    return (data, '');
                  },
                  filters: [
                    TextTableFilter(
                      id: "content",
                      chipFormatter: (value) => 'Content has "$value"',
                      name: "Content",
                    ),
                    DropdownTableFilter<Gender>(
                      items: Gender.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(growable: false),
                      chipFormatter: (value) =>
                          'Author is ${value.name.toLowerCase()}',
                      id: "authorGender",
                      name: "Author's Gender",
                    ),
                    DateTimePickerTableFilter(
                      id: "1",
                      name: "Date picker",
                      chipFormatter: (date) => "Date is $date",
                      initialValue: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now(),
                      dateFormat: DateFormat.yMd(),
                    ),
                    DateRangePickerTableFilter(
                      id: "2",
                      name: "DateRange picker",
                      chipFormatter: (date) => "Date is $date",
                      initialValue: null,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now(),
                      formatter: (range) => "${range.start} - ${range.end}",
                    ),
                  ],
                  filterBarChild: PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.red,
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
                          final index =
                              Random().nextInt(tableController.totalItems);
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
                          tableController.removeRowAt(0);
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Remove last row"),
                        onTap: () {
                          tableController
                              .removeRowAt(tableController.totalItems - 1);
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Remove random row"),
                        onTap: () {
                          final index =
                              Random().nextInt(tableController.totalItems);
                          tableController.removeRowAt(index);
                        },
                      ),
                    ],
                  ),
                  fixedColumnCount: 2,
                  columns: [
                    RowSelectorColumn(),
                    TableColumn(
                      title: const Text("Id"),
                      cellBuilder: (context, item, index) =>
                          Text(item.id.toString()),
                      size: const FixedColumnSize(100),
                    ),
                    TableColumn(
                      title: const Text("Author"),
                      cellBuilder: (context, item, index) => Text(item.author),
                      sortable: true,
                      id: "author",
                      size: const FractionalColumnSize(.15),
                    ),
                    DropdownTableColumn(
                      title: const Text("Enabled"),
                      // cellBuilder: (context, item, index) => Text(item.isEnabled ? "Yes" : "No"),
                      items: const <DropdownMenuItem<bool>>[
                        DropdownMenuItem(value: true, child: Text("Yes")),
                        DropdownMenuItem(value: false, child: Text("No")),
                      ],
                      size: const FixedColumnSize(100),
                      getter: (item, index) => item.isEnabled,
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        item.isEnabled = newValue;
                        return true;
                      },
                    ),
                    TableColumn(
                      title: const Text("Author Gender"),
                      cellBuilder: (context, item, index) =>
                          Text(item.authorGender.name),
                      sortable: true,
                      id: "authorGender",
                      size: const MaxColumnSize(
                          FractionalColumnSize(.2), FixedColumnSize(100)),
                    ),
                    TextTableColumn(
                      title: const Text("Number"),
                      format: const NumericColumnFormat(),
                      // cellBuilder: (context, item, index) => Text(item.number.toString()),
                      size: const MaxColumnSize(
                          FixedColumnSize(100), FractionalColumnSize(.18)),
                      getter: (item, index) => item.number.toString(),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        item.number = int.parse(newValue);
                        return true;
                      },
                    ),
                    LargeTextTableColumn(
                      title: const Text("Content "),
                      size: const RemainingColumnSize(),
                      getter: (item, index) => item.content,
                      fieldLabel: "Content",
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        item.content = newValue;
                        return true;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
