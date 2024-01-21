import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/feature/register/data/repo/register_repo/register_repo.dart';

class RegisterWithEmailAndPassword extends RegisterRepo {
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  Future<Either<FirebaseException, UserCredential>> register({
    required Map args,
  }) async {
    try {
      print(args.toString());
      print(args.toString());
      return await instance
          .createUserWithEmailAndPassword(
        email: args['email'],
        password: args['password'],
      )
          .then(
        (value) {
          return right(value);
        },
      );
    } on FirebaseAuthException catch (onError) {
      return left(onError);
    }
  }
}
