import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/models/bus/bus_from_firestore/bus.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final tableController = PagedDataTableController<String, Bus>();
  @override
  Widget build(BuildContext context) {
    List<Bus> dataBus;
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
                  selectedRow: context.colors.lightPrimary,
                  rowColor: (index) => context.colors.secondary,
                  // index.isEven
                  //     ? context.colors.lightPrimary
                  //     :
                ),
                child: PagedDataTable<String, Bus>(
                  controller: tableController,
                  initialPageSize: 5,
                  configuration: const PagedDataTableConfiguration(),
                  pageSizes: const [5, 10, 20],
                  fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                    print(pageSize);
                    print(sortModel);
                    print(filterModel);
                    print(pageToken);

                    dataBus = await Future.delayed(Duration(seconds: 2), () {
                      return MockData.dataBus;
                    });
                    return (dataBus, '');
                  },
                  filters: [
                    TextTableFilter(
                      id: "number",
                      name: "number",
                      chipFormatter: (value) => value,
                    ),
                    DropdownTableFilter<bool>(
                      id: "active",
                      name: "active",
                      items: const <DropdownMenuItem<bool>>[
                        DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: true,
                            child: Text(
                              "Oui",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            )),
                        DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: false,
                            child: Text(
                              "Non",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )),
                      ],
                      chipFormatter: (value) => value.toString(),
                    ),
                  ],
                  filterBarChild: PopupMenuButton(
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
                          // tableController.refresh();
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
                  columns: [
                    RowSelectorColumn(),
                    TableColumn(
                      title: const Text("Index"),
                      cellBuilder: (context, item, index) =>
                          Text(index.toString()),
                    ),
                    LargeTextTableColumn(
                      showTooltip: false,
                      title: const Text("Source"),
                      getter: (item, index) => item.source,
                      // sortable: true,
                      id: "source",
                      size: const FractionalColumnSize(.2),
                      fieldLabel: "source",
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        print(newValue);
                        return true;
                      },
                    ),
                    LargeTextTableColumn(
                      title: const Text("Destination"),
                      showTooltip: false,
                      getter: (item, index) => item.destination,
                      sortable: true,
                      id: "destination",
                      size: const FractionalColumnSize(.2),
                      fieldLabel: "destination",
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        print(newValue);
                        return true;
                      },
                    ),
                    TextTableColumn(
                      id: 'number',
                      title: const Text("Numéro"),
                      format: const NumericColumnFormat(),
                      size: const FractionalColumnSize(.12),
                      getter: (item, index) => item.number.toString(),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      setter: (item, newValue, index) async {
                        // await Future.delayed(const Duration(seconds: 2));
                        // item.number = int.parse(newValue);
                        print(newValue);
                        return true;
                      },
                    ),
                    DropdownTableColumn(
                      id: 'active',
                      title: const Text("Actif"),
                      items: const <DropdownMenuItem<bool>>[
                        DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: true,
                            child: Text(
                              "Oui",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            )),
                        DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: false,
                            child: Text(
                              "Non",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )),
                      ],
                      size: const FractionalColumnSize(.12),
                      getter: (item, index) => item.isActive,
                      setter: (item, newValue, index) async {
                        // await Future.delayed(const Duration(seconds: 2));
                        print(newValue);
                        return true;
                      },
                    ),
                    LargeTextTableColumn(
                      title: const Text("Itinéraire"),
                      showTooltip: false,
                      size: const RemainingColumnSize(),
                      getter: (item, index) =>
                          item.roadMap.map((stop) => stop).toString(),
                      fieldLabel: "roadMap",
                      setter: (item, newValue, index) async {
                        await Future.delayed(const Duration(seconds: 2));
                        // item.content = newValue;
                        print(newValue);
                        return false;
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
}
