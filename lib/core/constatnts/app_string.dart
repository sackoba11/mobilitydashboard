import 'package:mobilitydashboard/models/table_column/table_column.dart';
import 'package:pluto_grid/pluto_grid.dart';

class AppString {
  static List<TableColumn> titleTableHeaderBus = [
    TableColumn(
        title: 'Index', enableRowChecked: true, type: PlutoColumnType.number()),
    TableColumn(
        title: 'Numero',
        enableRowChecked: false,
        type: PlutoColumnType.number()),
    TableColumn(
        title: 'Source', enableRowChecked: false, type: PlutoColumnType.text()),
    TableColumn(
        title: 'Destination',
        enableRowChecked: false,
        type: PlutoColumnType.text()),
    TableColumn(
        title: 'Actif',
        enableRowChecked: false,
        type:
            PlutoColumnType.select(['Oui', 'Non'], enableColumnFilter: false)),
    TableColumn(
        title: 'Itineraires',
        enableRowChecked: false,
        type: PlutoColumnType.text()),
  ];
  List<String> titleTableHeaderDriver = [
    'Index',
    'Nom',
    'email',
    'Numero',
  ];
  List<String> titleTableHeaderUsers = [
    'Index',
    'Nom',
    'email',
  ];
  List<String> titleTableHeaderStation = [
    'Index',
    'Libelle',
    'Commune',
    'Type',
    'Localisation'
  ];
}
