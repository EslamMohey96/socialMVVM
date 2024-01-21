import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataRepo {
  Future<Either<FirebaseException, void>> setUserData({
    required Map args,
  });
}
