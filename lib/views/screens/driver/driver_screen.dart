import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/models/driver/driver.dart';
import 'package:mobilitydashboard/views/widgets/table_template.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';
import '../../widgets/customWoltModalSheetPage.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/filter_Popup_menu_button.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Driver>();
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController searchTextEditingController = TextEditingController();
    TextEditingController numberTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    List<Driver> dataDrivers = MockData.drivers;
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                title: 'Conducteurs',
                textEditingController: searchTextEditingController,
              ),
              context.gaps.small,
              Expanded(
                  child: TableTemplate<String, Driver>(
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
                    title: const Text("email"),
                    getter: (item, index) => item.email,
                    id: "email",
                    size: const RemainingColumnSize(),
                    fieldLabel: "email",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                  LargeTextTableColumn(
                    showTooltip: false,
                    title: const Text("Numero"),
                    getter: (item, index) => item.number,
                    id: "number",
                    size: const RemainingColumnSize(),
                    fieldLabel: "number",
                    setter: (item, newValue, index) async {
                      await Future.delayed(const Duration(seconds: 2));
                      print(newValue);
                      return true;
                    },
                  ),
                ],
                fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                  await Future.delayed(const Duration(seconds: 2));
                  return (dataDrivers, null);
                },
                filters: [
                  TextTableFilter(
                    id: "number",
                    name: "number",
                    chipFormatter: (value) => value,
                  ),
                ],
                filterBarChild: Row(
                  children: [
                    FilterPopupMenuButtonAction(
                        tableController: tableController,
                        onPressed: () async {
                          await customWoltModalSheetPage(
                              title: 'Ajout de conducteur',
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
                                  id: 'email',
                                  labelText: 'Email',
                                  textEditingController:
                                      emailTextEditingController,
                                  textInputType: TextInputType.text,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'valeur requise'),
                                    FormBuilderValidators.email(
                                        errorText: 'Donner un email valable')
                                  ]),
                                ),
                                context.gaps.normal,
                                CustomTextFormField(
                                  id: 'number',
                                  labelText: 'Numero',
                                  textEditingController:
                                      numberTextEditingController,
                                  textInputType: TextInputType.number,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'valeur requise'),
                                    FormBuilderValidators.numeric(
                                        errorText:
                                            'valeur numerique uniquement'),
                                    FormBuilderValidators.maxLength(10,
                                        errorText: '10 chiffres requis'),
                                    FormBuilderValidators.minLength(10,
                                        errorText: '10 chiffres requis')
                                  ]),
                                ),
                                context.gaps.normal,
                              ],
                              onTap: () {
                                tableController.insertAt(
                                    0,
                                    Driver(
                                      name: nameTextEditingController.text,
                                      email: emailTextEditingController.text,
                                      number: numberTextEditingController.text,
                                    ));
                              });
                        })
                  ],
                ),
              ))
            ])));
  }
}
