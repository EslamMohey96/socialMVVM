import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploadImageRepo {
  Future<Either<FirebaseAuthException , String>> upload({
    required XFile? xFile,
  });
}
