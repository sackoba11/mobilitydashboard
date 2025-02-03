enum Active {
  oui(true),
  non(false);

  const Active(this.status);

  final bool status;
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
