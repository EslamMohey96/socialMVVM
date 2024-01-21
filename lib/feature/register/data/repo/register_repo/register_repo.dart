import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  Future<Either<FirebaseException, UserCredential>> register({
    required Map args,
  });
}
