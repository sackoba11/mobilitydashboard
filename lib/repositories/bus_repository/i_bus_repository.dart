import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus.dart';

abstract class IBusRepository {
  Future<Either<AppError, List<Bus>>> getAllBus();
  Future<Either<AppError, List<Bus>>> getActiveBus();
  Future<Either<AppError, bool>> addBus({required Bus data});
}
