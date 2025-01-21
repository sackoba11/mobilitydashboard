import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/models/driver/driver.dart';
import 'package:mobilitydashboard/views/widgets/table_template.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';
import '../../widgets/filter_Popup_menu_button.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Driver>();
    List<Driver> dataDrivers = MockData.drivers;
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: TableTemplate<String, Driver>(
          title: 'Conducteurs',
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
            LargeTextTableColumn(
              showTooltip: false,
              title: const Text("Mot de passe"),
              getter: (item, index) => item.password,
              id: "password",
              size: const RemainingColumnSize(),
              fieldLabel: "password",
              setter: (item, newValue, index) async {
                await Future.delayed(const Duration(seconds: 2));
                print(newValue);
                return true;
              },
            ),
          ],
          data: dataDrivers,
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
                  onPressed: () {
                    tableController.insertAt(
                        0,
                        Driver(
                            name: 'Coulibaly Yaya',
                            email: 'Yayagmail.com',
                            number: '030420202',
                            password: 'sgngkgegzngzgz3'));
                    print('done');
                  }),
            ],
          ),
        ));
  }
}
