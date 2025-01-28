import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/cubits/bus_cubit/bus_cubit.dart';
import 'package:mobilitydashboard/di.dart';
import 'package:mobilitydashboard/views/widgets/table_template.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../models/bus/bus.dart';
import '../../widgets/custom_large_text_table_column.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/filter_Popup_menu_button.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Bus>();
    TextEditingController searchTextEditingController = TextEditingController();
    TextEditingController numberTextEditingController = TextEditingController();
    TextEditingController sourceTextEditingController = TextEditingController();
    TextEditingController destinationTextEditingController =
        TextEditingController();
    TextEditingController roadMapTextEditingController =
        TextEditingController();

    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                  title: 'Bus',
                  textEditingController: searchTextEditingController),
              context.gaps.small,
              Expanded(
                  child: TableTemplate<String, Bus>(
                tableController: tableController,
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
                  CustomTextTableFilter(
                    chipFormatter: (value) => value,
                    id: 'number',
                    name: 'Numero',
                  ),
                  DropdownTableFilter<bool>(
                    id: "active",
                    name: "active",
                    decoration: const InputDecoration(
                        labelText: "active",
                        hintText: "active",
                        border: OutlineInputBorder()),
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
                    WoltModalSheet.show(
                      barrierDismissible: false,
                      context: context,
                      pageListBuilder: (bottomSheetContext) => [
                        WoltModalSheetPage(
                            topBarTitle: Center(
                                child: Text(
                              'Ajout',
                              style: TextStyle(color: context.colors.textColor),
                            )),
                            pageTitle: const Center(child: Text('Ajout')),
                            // isTopBarLayerAlwaysVisible: true,
                            backgroundColor: context.colors.secondary,
                            trailingNavBarWidget: IconButton(
                              padding: const EdgeInsets.all(8),
                              icon: const Icon(Icons.close),
                              onPressed: Navigator.of(bottomSheetContext).pop,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      labelText: 'Numero',
                                      textEditingController:
                                          numberTextEditingController,
                                    ),
                                    context.gaps.normal,
                                    CustomTextFormField(
                                      labelText: 'Source',
                                      textEditingController:
                                          sourceTextEditingController,
                                    ),
                                    context.gaps.normal,
                                    CustomTextFormField(
                                      labelText: 'Destination',
                                      textEditingController:
                                          destinationTextEditingController,
                                    ),
                                    context.gaps.normal,
                                    CustomTextFormField(
                                      labelText: 'Itineraires',
                                      textEditingController:
                                          roadMapTextEditingController,
                                    ),
                                    context.gaps.large,
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: context.colors.primary),
                                          child: Center(
                                            child: Text(
                                              'Valider',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: context.colors.black),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    );
                    // tableController.insertAt(
                    //     0,
                    //     Bus(
                    //         position: MockData.stop.first,
                    //         startDate: null,
                    //         number: 29,
                    //         source: 'Riviera',
                    //         destination: 'Gare Sud',
                    //         isActive: true,
                    //         roadMap: []));
                  },
                ),
              ))
            ])));
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(width: 0.4, color: context.colors.textColor))),
      onSaved: (newValue) {
        if (newValue != null && newValue.isNotEmpty) {
          textEditingController.text = newValue;
        }
      },
    );
  }
}
