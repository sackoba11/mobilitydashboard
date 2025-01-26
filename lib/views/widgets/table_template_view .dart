import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/constatnts/app_string.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/data/mockData/mock_data.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../core/assets/assets.gen.dart';
import '../../responsive.dart';

class TableTemplateView extends StatelessWidget {
  const TableTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PlutoColumn> column = AppString.titleTableHeaderBus
        .map((title) => PlutoColumn(
              title: title,
              field: title,
              // enableRowChecked: true,
              enableContextMenu: false,
              enableDropToResize: false,
              enableFilterMenuItem: false,
              type: PlutoColumnType.text(),
            ))
        .toList();
    final List<PlutoRow> row = MockData.dataBus
        .map((data) => PlutoRow(cells: {
              AppString.titleTableHeaderBus[0].toString(): PlutoCell(value: 2),
              AppString.titleTableHeaderBus[1].toString():
                  PlutoCell(value: data.number),
              AppString.titleTableHeaderBus[2].toString():
                  PlutoCell(value: data.source),
              AppString.titleTableHeaderBus[3].toString():
                  PlutoCell(value: data.destination),
              AppString.titleTableHeaderBus[4].toString():
                  PlutoCell(value: data.isActive),
              AppString.titleTableHeaderBus[5].toString():
                  PlutoCell(value: data.roadMap),
            }))
        .toList();

    // late final PlutoGridStateManager stateManager;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Accueil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: context.colors.secondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: context.colors.primary,
                          ),
                        ),
                        prefixIcon: Icon(Icons.search, size: 18.sp),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        hintText: 'Recherche',
                      ),
                    ),
                  ),
                ),
              if (Responsive.isMobile(context))
                IconButton(
                    tooltip: 'Recherche',
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
              context.gaps.normal,
              if (!Responsive.isMobile(context))
                IconButton(
                  tooltip: 'Se deconnecter',
                  onPressed: () {},
                  icon: Container(
                    // height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Assets.svg.logout1.svg(
                            color: context.colors.textColor,
                            height: 20.sp,
                            width: 20.sp),
                        context.gaps.small,
                        Text(
                          'Se deconnecter',
                          style: TextStyle(color: context.colors.textColor),
                        )
                      ],
                    ),
                  ),
                ),
              if (Responsive.isMobile(context))
                IconButton(
                  tooltip: 'Se deconnecter',
                  onPressed: () {},
                  icon: Assets.svg.logout1.svg(
                      color: context.colors.textColor, height: 20, width: 20),
                ),
            ],
          ),
          context.gaps.small,
          Expanded(
            child: PlutoGrid(
              createHeader: (stateManager) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton(
                        tooltip: 'filtre',
                        icon: Assets.svg.filter.svg(
                            color: context.colors.textColor,
                            height: 30.sp,
                            width: 30.sp),
                        itemBuilder: (context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            child: const Text(
                              "Print selected rows",
                            ),
                            onTap: () {},
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem(
                            child: const Text("appendNewRows"),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        tooltip: 'Ajouter',
                        onPressed: () {
                          stateManager.appendRows([
                            PlutoRow(
                              cells: {
                                'id': PlutoCell(value: 'user1 test'),
                                'name': PlutoCell(value: 'Mike'),
                                'age': PlutoCell(value: 20),
                                'role': PlutoCell(value: 'Programmer'),
                                'joined': PlutoCell(value: '2021-01-01'),
                                'working_time': PlutoCell(value: '09:00'),
                                'salary': PlutoCell(value: 300),
                              },
                            ),
                          ]);
                        },
                        icon: Assets.svg.addRow.svg(
                            color: context.colors.textColor,
                            height: 35.sp,
                            width: 35.sp),
                      ),
                    ),
                  ],
                );
              },
              columns: column,
              rows: row,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                // stateManager = event.stateManager;
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
              },
              // onRowChecked: (event) {
              //   event.row!.setChecked(true);
              //   print(event.row!.toJson());
              // },
              configuration: PlutoGridConfiguration(
                  style: PlutoGridStyleConfig.dark(
                enableColumnBorderVertical: false,
                enableCellBorderVertical: false,
                enableRowColorAnimation: true,
                cellColorInEditState: context.colors.textColor,
                checkedColor: context.colors.lightPrimary,
                activatedColor: context.colors.lightPrimary,
                rowColor: context.colors.secondary,
                gridBorderColor: context.colors.secondary,
                gridBorderRadius: BorderRadius.circular(8.sp),
                borderColor: context.colors.textColor,
                gridBackgroundColor: context.colors.secondary,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
