import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';
import '../../models/driver/driver.dart';
import '../../models/user/my_user.dart';

abstract class IDriverRepository {
  Future<Either<AppError, List<Driver>>> getAllDrivers();
  Future<Either<AppError, List<MyUser>>> getAllUsers();
}
