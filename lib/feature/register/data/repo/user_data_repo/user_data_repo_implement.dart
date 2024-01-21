import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/feature/register/data/repo/user_data_repo/user_data_repo.dart';

class SetUserData extends UserDataRepo {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  @override
  Future<Either<FirebaseException, void>> setUserData({
    required Map args,
  }) async {
    try {
      print('-----------------------');

      return right(await instance.collection('users').doc(args['uId']).set({
        'email': args['email'],
        'uId': args['uId'],
        'name': args['name'],
        'phone': args['phone'],
        'isEmailVerified': false,
        'image': args['image'],
        'background': args['background'],
        'bio': args['bio']
      }));
    } on FirebaseAuthException catch (onError) {
      print('+++++++++++++++');
      return left(onError);
    }
  }
}
