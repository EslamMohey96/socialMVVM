import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:social/constants.dart';
import 'package:social/core/shared_components/custom_toast_message.dart';
import 'package:social/core/utils/cacheHelper.dart';
import 'package:social/feature/register/data/repo/register_repo/register_repo_implement.dart';
import 'package:social/feature/register/data/repo/user_data_repo/user_data_repo_implement.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  bool visiblePassword = false;

  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(RegisterVisiblePasswordState());
  }

  bool registerDone = true;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    context,
    String bio = "write your bio",
    String background =
        "https://img.freepik.com/free-vector/paper-style-white-monochrome-background_52683-66443.jpg?w=740&t=st=1704366685~exp=1704367285~hmac=fa0444a85ae4c705516111a8ea3d00b261fb9ab84c429dc7e70fb13a859d0bb1",
    String image =
        "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg?w=740",
  }) async {
    registerDone = false;
    emit(RegisterLoadingState());
    await RegisterWithEmailAndPassword().register(
      args: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        value.fold(
          (e) {
            registerDone = true;
            emit(RegisterErrorState(e));
          },
          (success) {
            userCreate(
                name: name,
                email: email,
                phone: phone,
                uId: success.user!.uid,
                image: image,
                background: background,
                bio: bio,
                context: context);
          },
        );
      },
    );
  }

  void userCreate(
      {required String name,
      required String email,
      required String phone,
      required String uId,
      required String image,
      required String background,
      required String bio,
      context}) async {
    await SetUserData().setUserData(
      args: {
        'email': email,
        'uId': uId,
        'name': name,
        'phone': phone,
        'isEmailVerified': false,
        'image': image,
        'background': background,
        'bio': bio
      },
    ).then((value) {
      value.fold(
        (e) {
          emit(UserDataRegErrorState(e.message));
        },
        (r) {
          changeUId(uId, context);
        },
      );
    });
  }

  bool changeUIdDone = false;
  changeUId(id, context) {
    changeUIdDone = false;
    cacheHelper
        .setData(
      key: 'uId',
      value: id,
    )
        .then((value) {
      uIdConst = cacheHelper.getData(
        key: 'uId',
      );
    }).then((value) {
      // socialCubit.get(context).getUserData(uIdConst);
      registerDone = true;
      changeUIdDone = true;
      emit(ChangeUIdDoneState());
    });
  }
}
