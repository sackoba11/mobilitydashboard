import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../../data/mockData/mock_data.dart';
import '../../../models/gare/gare.dart';
import '../../widgets/filter_Popup_menu_button.dart';
import '../../widgets/table_template.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Gare>();
    List<Gare> dataDrivers = MockData.garesGbaka + MockData.garesTaxi;
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: TableTemplate<String, Gare>(
          title: 'Gares',
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
                        Gare(
                            name: 'Coulibaly Yaya',
                            commune: 'Yopougon',
                            type: 'Gbaka',
                            location: {
                              "label": "teste",
                              "lat": 5.3502292,
                              "long": -3.9881887,
                            }));
                    print('done');
                  }),
            ],
          ),
        ));
  }
}
