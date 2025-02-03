enum Active {
  oui("Oui"),
  non("Non");

  const Active(this.name);

  final String name;
}

enum TypeCar {
  taxi("Taxi"),
  gbaka("Gbaka");

  const TypeCar(this.type);

  final String type;
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
