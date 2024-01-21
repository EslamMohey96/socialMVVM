import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/feature/login/data/repo/login_repo.dart';

class LoginWithEmailAndPassword extends LoginRepo {
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Future<Either<FirebaseAuthException, UserCredential>> login({
    required Map args,
  }) async {
    try {
      print('-----------');
      print(args.toString());
      return await instance
          .signInWithEmailAndPassword(
        email: args['email'],
        password: args['password'],
      )
          .then((value) {
        return Right(value);
      });
    } on FirebaseAuthException catch (onError) {
      return Left(onError);
    }
    // return null;
  }
}
