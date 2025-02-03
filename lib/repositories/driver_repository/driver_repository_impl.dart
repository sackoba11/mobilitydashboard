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
  static final List<Post> _backend = [];

  static void generate(int count, MyUser user) {
    _backend.clear();
    _backend.addAll(
        List.generate(count, (index) => Post.random(id: index, user: user)));
  }

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
    var len = userslistFirebse.length;
    print(len);
    userslistFirebse.map((e) => generate(len, e));
    print(_backend);
    return right(userslistFirebse);
  }
}

class Post {
  final int id;
  String name;
  String email;

  Post({required this.id, required this.name, required this.email});

  factory Post.random({required int id, required MyUser user}) {
    return Post(
      id: id,
      name: user.name,
      email: user.email,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is Post ? other.id == id : false;

  @override
  String toString() => "Post(id: $id, name: $name, email: $email)";
}
