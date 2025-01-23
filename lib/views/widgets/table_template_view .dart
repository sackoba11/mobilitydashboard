import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../responsive.dart';

class TableTemplateView extends StatelessWidget {
  const TableTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final List<PlutoColumn> columns = <PlutoColumn>[
      PlutoColumn(
        title: 'Id',
        field: 'id',
        width: size.width * .08,
        enableRowChecked: true,
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Name',
        field: 'name',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .08,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Age',
        field: 'age',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .08,
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Role',
        field: 'role',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .12,
        type: PlutoColumnType.select(<String>[
          'Programmer',
          'Designer',
          'Owner',
        ]),
      ),
      PlutoColumn(
        title: 'Joined',
        field: 'joined',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .12,
        type: PlutoColumnType.date(),
      ),
      PlutoColumn(
        title: 'Working time',
        field: 'working_time',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .12,
        type: PlutoColumnType.time(),
      ),
      PlutoColumn(
        title: 'salary',
        field: 'salary',
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        width: size.width * .12,
        type: PlutoColumnType.currency(),
        footerRenderer: (rendererContext) {
          return PlutoAggregateColumnFooter(
            rendererContext: rendererContext,
            formatAsCurrency: true,
            type: PlutoAggregateColumnType.sum,
            format: '#,###',
            alignment: Alignment.center,
            titleSpanBuilder: (text) {
              return [
                const TextSpan(
                  text: 'Sum',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(text: ' : '),
                TextSpan(text: text),
              ];
            },
          );
        },
      ),
    ];

    final List<PlutoRow> rows = [
      PlutoRow(
        cells: {
          'id': PlutoCell(value: 'user1'),
          'name': PlutoCell(value: 'Mike'),
          'age': PlutoCell(value: 20),
          'role': PlutoCell(value: 'Programmer'),
          'joined': PlutoCell(value: '2021-01-01'),
          'working_time': PlutoCell(value: '09:00'),
          'salary': PlutoCell(value: 300),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: 'user2'),
          'name': PlutoCell(value: 'Jack'),
          'age': PlutoCell(value: 25),
          'role': PlutoCell(value: 'Designer'),
          'joined': PlutoCell(value: '2021-02-01'),
          'working_time': PlutoCell(value: '10:00'),
          'salary': PlutoCell(value: 400),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: 'user3'),
          'name': PlutoCell(value: 'Suzi'),
          'age': PlutoCell(value: 40),
          'role': PlutoCell(value: 'Owner'),
          'joined': PlutoCell(value: '2021-03-01'),
          'working_time': PlutoCell(value: '11:00'),
          'salary': PlutoCell(value: 700),
        },
      ),
    ];
    late final PlutoGridStateManager stateManager;

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
                  'title',
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          context.gaps.small,
          Expanded(
            child: PlutoGrid(
              columns: columns,
              rows: rows,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
              },
              configuration: PlutoGridConfiguration(
                  columnFilter: PlutoGridColumnFilterConfig(),
                  style: PlutoGridStyleConfig.dark(
                    enableColumnBorderVertical: false,
                    enableCellBorderVertical: false,
                    enableRowColorAnimation: true,
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
