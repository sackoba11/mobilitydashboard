enum Active {
  oui("Oui"),
  non("Non");

  const Active(this.name);

  final String name;
}

class AppString {
  static List<String> titleTableHeaderBus = [
    'Index',
    'Numero',
    'Source',
    'Destination',
    'Actif',
    'Itineraires',
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
