import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/mockData/mock_data.dart';
import '../../error/app_error.dart';
import '../../models/gare/gare.dart';
import '../../models/itineraire_gare/itineraire_gare.dart';
import 'i_station_repository.dart';

@LazySingleton(as: IStationRepository)
class StationRepositoryImpl implements IStationRepository {
  @override
  Future<Either<AppError, List<Gare>>> getAllGares() async {
    try {
      //get all stations on snapshot
      final snapShotListStation =
          await FirebaseFirestore.instance.collection('Gares').get();
      final docsListStation = snapShotListStation.docs;
      //transform snapshot list to list of Station modele
      final listFirebaseStation =
          docsListStation.map((e) => Gare.fromJson(e.data())).toList();

      return right(listFirebaseStation);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, bool>> addAllGares() async {
    List<Gare> garesGbaka = MockData.garesGbaka + MockData.garesTaxi;
    // List<Gare> garestaxi = MockData.garesTaxi;
    // List<ItineraireGare> itineraireGbaka = MockData.itineraireGbaka;
    // List<ItineraireGare> itineraireTaxi = MockData.itineraireTaxi;
    try {
      for (var element in garesGbaka) {
        await FirebaseFirestore.instance
            .collection("Gares")
            .add(element.toJson());
      }
      // for (var element in garestaxi) {
      //   await FirebaseFirestore.instance
      //       .collection("GaresTaxi")
      //       .add(element.toJson());
      // }
      // for (var element in itineraireGbaka) {
      //   await FirebaseFirestore.instance
      //       .collection("ItinerairesGbaka")
      //       .add(element.toJson());
      // }
      // for (var element in itineraireTaxi) {
      //   await FirebaseFirestore.instance
      //       .collection("ItinerairesTaxi")
      //       .add(element.toJson());
      // }
      return right(true);
    } catch (e) {
      return left(GenericAppError("erreur : ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary() async {
    try {
      final snapShotListGbaka =
          await FirebaseFirestore.instance.collection('ItinerairesGbaka').get();

      final docListItineraryGbaka = snapShotListGbaka.docs;
      final listItineraryGbaka = docListItineraryGbaka
          .map((e) => ItineraireGare.fromJson(e.data()))
          .toList();
      final snapShotListTaxi =
          await FirebaseFirestore.instance.collection('ItinerairesTaxi').get();

      final docListItineraryTaxi = snapShotListTaxi.docs;
      final listItineraryTaxi = docListItineraryTaxi
          .map((e) => ItineraireGare.fromJson(e.data()))
          .toList();

      final listItineraires = listItineraryGbaka + listItineraryTaxi;
      return right(listItineraires);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }
}
