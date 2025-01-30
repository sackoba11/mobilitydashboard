import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/cubits/bus_cubit/bus_cubit.dart';
import 'package:mobilitydashboard/di.dart';
import 'package:mobilitydashboard/models/stop/stop.dart';
import 'package:mobilitydashboard/views/widgets/table_template.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../core/constatnts/app_string.dart';
import '../../../models/bus/bus.dart';
import '../../widgets/customWoltModalSheetPage.dart';
import '../../widgets/custom_large_text_table_column.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_field_lat_long.dart';
import '../../widgets/custom_text_form_field.dart';
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
                    chipFormatter: (value) => 'Numero : $value',
                    id: 'number',
                    name: 'Numero',
                  ),
                  DropdownTableFilter<Active>(
                    id: "active",
                    name: "active",
                    decoration: const InputDecoration(
                        labelText: "actif",
                        hintText: "actif",
                        border: OutlineInputBorder()),
                    items: Active.values
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: e.index == 0
                                  ? const TextStyle(color: Colors.green)
                                  : TextStyle(color: context.colors.red),
                            )))
                        .toList(growable: false),
                    chipFormatter: (value) =>
                        'Actif : ${value.name.toLowerCase()}',
                  ),
                ],
                filterBarChild: FilterPopupMenuButtonAction(
                  tableController: tableController,
                  onPressed: () async {
                    await customWoltModalSheetPage(
                        title: 'Ajout de Bus',
                        context: context,
                        tableController: tableController,
                        columns: [
                          CustomTextFormField(
                            id: 'number',
                            labelText: 'Numero',
                            textEditingController: numberTextEditingController,
                            textInputType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'valeur requise'),
                              FormBuilderValidators.numeric(
                                  errorText: 'valeur numerique uniquement'),
                              FormBuilderValidators.maxLength(4,
                                  errorText: '4 chiffres max'),
                            ]),
                          ),
                          context.gaps.normal,
                          CustomTextFormField(
                            id: 'source',
                            labelText: 'Source',
                            textEditingController: sourceTextEditingController,
                            textInputType: TextInputType.text,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'valeur requise'),
                              // FormBuilderValidators.alphabetical(),
                            ]),
                          ),
                          context.gaps.normal,
                          CustomTextFormField(
                            id: 'destination',
                            labelText: 'Destination',
                            textEditingController:
                                destinationTextEditingController,
                            textInputType: TextInputType.text,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'valeur requise'),
                            ]),
                          ),
                          context.gaps.normal,
                          const CustomTextFieldLatLong(
                            name: 'Stop',
                            index: 0,
                          )
                        ],
                        onTap: () {
                          tableController.insertAt(
                              0,
                              Bus(
                                  position: null,
                                  startDate: null,
                                  number: int.parse(
                                      numberTextEditingController.text),
                                  source: sourceTextEditingController.text,
                                  destination:
                                      destinationTextEditingController.text,
                                  isActive: false,
                                  roadMap: [
                                    Stop(
                                        lat: double.parse(
                                            roadMapTextEditingController.text),
                                        long: double.parse(
                                            roadMapTextEditingController.text))
                                  ]));
                          Navigator.of(context).pop();
                        });
                  },
                ),
              ))
            ])));
  }
}
