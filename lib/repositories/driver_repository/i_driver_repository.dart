import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus.dart';
import '../../models/driver/driver.dart';

abstract class IDriverRepository {
  Future<Either<AppError, List<Driver>>> getAllDrivers();
  Future<Either<AppError, String>> activateBusService(
      {required Bus bus, required Position position});
  Future<Either<AppError, void>> updatePosition(
      {required int busNumber,
      required String idBus,
      required double lat,
      required double long});
  Future<Either<AppError, bool>> deactivateBusService(
      {required int busNumber, required String idBus});
}
