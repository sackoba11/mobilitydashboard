import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../error/app_error.dart';
import '../../models/driver/driver.dart';
import '../../models/user/my_user.dart';
import 'i_driver_repository.dart';

@LazySingleton(as: IDriverRepository)
class DriverRepositoryImpl implements IDriverRepository {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("activeBus");

  @override
  Future<Either<AppError, List<Driver>>> getAllDrivers() async {
    final snapShotListDriver = await FirebaseFirestore.instance
        .collection('users')
        .where('isDriver', isEqualTo: true)
        .get();
    final docsListDriver = snapShotListDriver.docs;
    final driverlistFirebse =
        docsListDriver.map((e) => Driver.fromJson(e.data())).toList();
    return right(driverlistFirebse);
  }

  @override
  Future<Either<AppError, List<MyUser>>> getAllUsers() async {
    final snapShotListUsers = await FirebaseFirestore.instance
        .collection('users')
        .where('isDriver', isEqualTo: false)
        .get();
    final docsListUsers = snapShotListUsers.docs;
    final userslistFirebse =
        docsListUsers.map((e) => MyUser.fromJson(e.data())).toList();
    return right(userslistFirebse);
  }
}
