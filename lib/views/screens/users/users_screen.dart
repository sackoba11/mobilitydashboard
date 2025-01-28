import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';
import '../../../models/user/my_user.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/filter_Popup_menu_button.dart';
import '../../widgets/table_template.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, MyUser>();
    TextEditingController textEditingController = TextEditingController();
    List<MyUser> dataUsers = MockData.users;
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomNavBar(
                title: 'Utilisateurs',
                textEditingController: textEditingController,
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
                  await Future.delayed(const Duration(seconds: 2));
                  return (dataUsers, null);
                },
                filters: [
                  TextTableFilter(
                    id: "email",
                    name: "email",
                    chipFormatter: (value) => value,
                  ),
                ],
                filterBarChild: Row(
                  children: [
                    FilterPopupMenuButtonAction(
                        tableController: tableController,
                        onPressed: () {
                          tableController.insertAt(
                            0,
                            MyUser(
                              name: 'Kouassi Obed',
                              email: 'obedgmail.com',
                            ),
                          );
                          print('done');
                        }),
                  ],
                ),
              ))
            ])));
  }
}
