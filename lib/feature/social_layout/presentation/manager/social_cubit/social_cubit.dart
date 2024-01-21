import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:social/core/shared_components/custom_toast_message.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitial());

   static SocialCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKeyPost = GlobalKey();
  GlobalKey<FormState> formKeyMassage = GlobalKey();

  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController phoneController;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController postController = TextEditingController();
  late TextEditingController chatController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  final storage = FirebaseStorage.instance;

//profileImage
  XFile? profileImage;
  Future<void> getImage() async {
    try {
      profileImage = await imagePicker.pickImage(source: ImageSource.gallery);
      uploadImage();
      emit(ProfileImageSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ProfileImageErrorState(e.message));
    }
  }

  String fileProfileImage = '';
  void uploadImage() {
    File file = File(profileImage!.path);
    try {
      storage
          .ref()
          .child('users/${Uri.file(file.path).pathSegments.last}')
          .putFile(file)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          fileProfileImage = value;
        });
      });
    } on FirebaseAuthException catch (e) {
      emit(ProfileImageErrorState(e.message));
    }
  }

}
