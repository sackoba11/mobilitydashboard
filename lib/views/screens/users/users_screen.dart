import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../cubits/users_cubit/user_cubit.dart';
import '../../../di.dart';
import '../../../models/user/my_user.dart';
import '../../widgets/customWoltModalSheetPage.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/filter_Popup_menu_button.dart';
import '../../widgets/table_template.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, MyUser>();
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController searchTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                title: 'Utilisateurs',
                textEditingController: searchTextEditingController,
              ),
              context.gaps.small,
              Expanded(
                  child: TableTemplate<String, MyUser>(
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
                ],
                fetcher: (pageSize, sortModel, filterModel, pageToken) async {
                  var dataUsers = await locator.get<UserCubit>().getAllUsers();
                  return (dataUsers, null);
                },
                filters: [
                  CustomTextTableFilter(
                    chipFormatter: (value) => 'recherche : $value',
                    id: 'search',
                    name: 'Recherche',
                  ),
                  CustomTextTableFilter(
                    id: "email",
                    name: "email",
                    chipFormatter: (value) => value,
                  ),
                ],
                filterBarChild: Row(
                  children: [
                    FilterPopupMenuButtonAction(
                        tableController: tableController,
                        onPressed: () async {
                          await customWoltModalSheetPage(
                              title: "Ajout d'utilisateur",
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
                              ],
                              onTap: () {
                                tableController.insertAt(
                                  0,
                                  MyUser(
                                    uid: '98dzhzuzzbz',
                                    name: nameTextEditingController.text,
                                    email: emailTextEditingController.text,
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ))
            ])));
  }

  static final List<MyUser> _backend = [];
  Future<PaginatedList<MyUser>> getPosts({
    required int pageSize,
    required String? pageToken,
    bool? status,
    String? searchQuery,
    String? sortBy,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;
    Iterable<MyUser> query = _backend;
    // query = query.where((element) => element.uid >= nextId);
    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      MyUser lastBus = resultSet.removeLast();
      nextPageToken = lastBus.uid;
    }
    return PaginatedList(items: resultSet, nextPageToken: nextId.toString());
  }
}

class PaginatedList<T> {
  final Iterable<T> _items;
  final String? _nextPageToken;

  List<T> get items => UnmodifiableListView(_items);
  String? get nextPageToken => _nextPageToken;

  PaginatedList({required Iterable<T> items, String? nextPageToken})
      : _items = items,
        _nextPageToken = nextPageToken;
}
