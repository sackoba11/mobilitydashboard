import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/cubits/bus_cubit/bus_cubit.dart';
import 'package:mobilitydashboard/di.dart';
import 'package:mobilitydashboard/views/widgets/table_template.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';
import '../../../models/bus/bus.dart';
import '../../widgets/custom_large_text_table_column.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/filter_Popup_menu_button.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Bus>();
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                  title: 'Bus', textEditingController: textEditingController),
              context.gaps.small,
              Expanded(
                  child: TableTemplate<String, Bus>(
                fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                  var bus = await locator.get<BusCubit>().getAllBus();
                  return (bus, null);
                },
                columns: [
                  customLargeTextTableColumn(
                    id: 'number',
                    title: 'Numéro',
                    getter: (item, index) => item.number.toString(),
                    setter: (item, newValue, index) async {
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
                  DropdownTableColumn<String, Bus, bool>(
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
                    size: const RemainingColumnSize(),
                    getter: (item, index) => item.isActive,
                    setter: (item, newValue, index) async {
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
                      print(newValue);
                      return false;
                    },
                  ),
                ],
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
                filterBarChild: FilterPopupMenuButtonAction(
                  tableController: tableController,
                  onPressed: () {
                    tableController.insertAt(
                        0,
                        Bus(
                            position: MockData.stop.first,
                            startDate: null,
                            number: 29,
                            source: 'Riviera',
                            destination: 'Gare Sud',
                            isActive: true,
                            roadMap: []));
                  },
                ),
              ))
            ])));
  }
}
