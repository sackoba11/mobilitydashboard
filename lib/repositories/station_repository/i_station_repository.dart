import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';
import '../../models/gare/gare.dart';
import '../../models/itineraire_gare/itineraire_gare.dart';

abstract class IStationRepository {
  Future<Either<AppError, List<Gare>>> getAllGares();
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary();
  Future<Either<AppError, bool>> addAllGares();
}
