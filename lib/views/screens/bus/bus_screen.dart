import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../data/mockData/mock_data.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';
import '../../widgets/custom_large_text_table_column.dart';
import '../../widgets/filter_Popup_menu_button.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Bus>();
    List<Bus> dataBus;
    return Scaffold(
      backgroundColor: context.colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
                child: PagedDataTable<String, Bus>(
                  controller: tableController,
                  initialPageSize: 5,
                  configuration: const PagedDataTableConfiguration(),
                  pageSizes: const [5, 10, 20],
                  fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                    dataBus =
                        await Future.delayed(const Duration(seconds: 2), () {
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
                  filterBarChild: Row(
                    children: [
                      IconButton(
                        tooltip: 'Ajouter',
                        onPressed: () {
                          tableController.insertAt(
                              0,
                              Bus(
                                  number: 28,
                                  source: 'Riviera',
                                  destination: 'Gare Sud',
                                  isActive: true,
                                  roadMap: MockData.stop));
                          print('done');
                        },
                        icon: Assets.svg.addRow.svg(
                            color: context.colors.textColor,
                            height: 35.sp,
                            width: 35.sp),
                      ),
                      filterPopupMenuButtom(
                          tableController: tableController, context: context),
                    ],
                  ),
                  columns: [
                    RowSelectorColumn(),
                    TableColumn(
                      title: const Text("Index"),
                      cellBuilder: (context, item, index) =>
                          Text(index.toString()),
                    ),
                    TextTableColumn(
                      id: 'number',
                      title: const Text("Numéro"),
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
                    customLargeTextTableColumn(
                      title: 'Source',
                      id: 'Source',
                      getter: (busItem, index) => busItem.source,
                      setter: (busItem, newValue, index) async {
                        print(newValue);
                        return true;
                      },
                    ),
                    customLargeTextTableColumn(
                      title: 'Destination',
                      id: 'destination',
                      getter: (busItem, index) => busItem.destination,
                      setter: (busItem, newValue, index) async {
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
                    customLargeTextTableColumn(
                      title: "Itinéraire",
                      id: "itinéraire",
                      getter: (item, index) =>
                          item.roadMap.map((stop) => stop).toString(),
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
