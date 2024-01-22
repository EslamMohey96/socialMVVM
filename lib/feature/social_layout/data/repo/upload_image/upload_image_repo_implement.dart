import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/feature/social_layout/data/repo/upload_image/upload_image_repo.dart';

class UploadImage extends UploadImageRepo {
  
  @override
  Future<Either<FirebaseAuthException, String>> upload({required XFile? xFile}) async {
    final storage = FirebaseStorage.instance;

    File file = File(xFile!.path);
    try {
      return right(await storage
          .ref()
          .child('users/${Uri.file(file.path).pathSegments.last}')
          .putFile(file)
          .then((value) {
        return value.ref.getDownloadURL();
      }));
    } on FirebaseAuthException catch (onError) {
      return left(onError);
    }
  }


}
