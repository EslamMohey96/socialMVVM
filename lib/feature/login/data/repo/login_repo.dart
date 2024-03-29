import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<FirebaseAuthException , UserCredential>> login({
    required Map args,
  });
}
