import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/cubits/station_cubit/station_cubit.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../core/constatnts/app_string.dart';
import '../../../di.dart';
import '../../../models/gare/gare.dart';
import '../../../models/stop/stop.dart';
import '../../widgets/customWoltModalSheetPage.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_field_lat_long.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/filter_Popup_menu_button.dart';
import '../../widgets/table_template.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Gare>();
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController searchTextEditingController = TextEditingController();
    TextEditingController municipalityTextEditingController =
        TextEditingController();
    TextEditingController typeTextEditingController = TextEditingController();
    Stop locationTextEditingController = Stop(lat: 0, long: 0);
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                title: 'Gares',
                textEditingController: searchTextEditingController,
              ),
              context.gaps.small,
              Expanded(
                  child: TableTemplate<String, Gare>(
                tableController: tableController,
                columns: [
                  LargeTextTableColumn(
                    showTooltip: false,
                    title: const Text("Nom"),
                    getter: (item, index) => item.name,
                    id: "name",
                    size: const RemainingColumnSize(),
                    fieldLabel: "name",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                  LargeTextTableColumn(
                    showTooltip: false,
                    title: const Text("Commune"),
                    getter: (item, index) => item.commune,
                    id: "commune",
                    size: const RemainingColumnSize(),
                    fieldLabel: "commune",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                  LargeTextTableColumn(
                    showTooltip: false,
                    title: const Text("Type"),
                    getter: (item, index) => item.type,
                    id: "type",
                    size: const RemainingColumnSize(),
                    fieldLabel: "type",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                  LargeTextTableColumn(
                    showTooltip: false,
                    title: const Text("Localisation"),
                    getter: (item, index) => item.location.toString(),
                    id: "location",
                    size: const RemainingColumnSize(),
                    fieldLabel: "location",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                ],
                fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                  var dataGares = await locator
                      .get<StationCubit>()
                      .getAllStationPaginated(
                          pageSize: pageSize,
                          searchQuery: filterModel["search"],
                          commune: filterModel["commune"],
                          type: filterModel["type"],
                          pageToken: pageToken);
                  return (dataGares.items, dataGares.nextPageToken);
                },
                filters: [
                  CustomTextTableFilter(
                    chipFormatter: (value) => 'recherche : $value',
                    id: 'search',
                    name: 'Recherche',
                  ),
                  CustomTextTableFilter(
                    chipFormatter: (value) => 'Commune : $value',
                    id: 'commune',
                    name: 'Commune',
                  ),
                  DropdownTableFilter<String>(
                    id: "type",
                    name: "Type",
                    decoration: const InputDecoration(
                        labelText: "Type",
                        hintText: "Type",
                        border: OutlineInputBorder()),
                    items: TypeCar.values
                        .map((e) => DropdownMenuItem(
                            value: e.type,
                            child: Text(
                              e.type,
                            )))
                        .toList(growable: false),
                    chipFormatter: (value) => 'Type : $value',
                  ),
                ],
                filterBarChild: Row(
                  children: [
                    FilterPopupMenuButtonAction(
                        tableController: tableController,
                        onPressed: () async {
                          await customWoltModalSheetPage(
                              locationStation: locationTextEditingController,
                              title: "Ajout d'une gare",
                              isStation: true,
                              context: context,
                              tableController: tableController,
                              columns: [
                                CustomTextFormField(
                                  id: 'name',
                                  labelText: 'Nom',
                                  textEditingController:
                                      nameTextEditingController,
                                  textInputType: TextInputType.text,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'valeur requise'),
                                  ]),
                                ),
                                context.gaps.normal,
                                CustomTextFormField(
                                  id: 'municipality',
                                  labelText: 'Commmune',
                                  textEditingController:
                                      municipalityTextEditingController,
                                  textInputType: TextInputType.text,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'valeur requise'),
                                  ]),
                                ),
                                context.gaps.normal,
                                CustomTextFormField(
                                  id: 'type',
                                  labelText: 'Type',
                                  textEditingController:
                                      typeTextEditingController,
                                  textInputType: TextInputType.text,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'valeur requise'),
                                  ]),
                                ),
                                context.gaps.normal,
                                const CustomTextFieldLatLong(
                                  label: 'Localisation',
                                  name: 'Stop',
                                  index: 0,
                                )
                              ],
                              onTap: () {
                                print(locationTextEditingController);
                                tableController.insertAt(
                                    0,
                                    Gare(
                                        name: nameTextEditingController.text,
                                        commune:
                                            municipalityTextEditingController
                                                .text,
                                        type: typeTextEditingController.text,
                                        location: locationTextEditingController
                                            .toJson()));
                              });
                        })
                  ],
                ),
              ))
            ])));
  }
}
