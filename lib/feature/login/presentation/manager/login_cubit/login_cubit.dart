import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/constants.dart';
import 'package:social/core/shared_components/custom_toast_message.dart';
import 'package:social/core/utils/cacheHelper.dart';
import 'package:social/feature/login/data/repo/login_repo_implement.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // List li = [];

  int? constraints;
  void changeConstraints(int constraints) {
    this.constraints = constraints;
    emit(ChangeConstraintsState());
  }

  bool visiblePassword = false;
  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(LogInVisiblePasswordState());
  }

  bool loginDone = false;
  userLogin({
    context,
    required email,
    required password,
  }) async {
    emit(LoginLoadingState());
    await LoginWithEmailAndPassword().login(
      args: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      value.fold(
        (err) {
          emit(LoginErrorState(err));
        },
        (success) {
          changeUId(success.user!.uid, context);
          emit(LoginSuccessState(success.user!.uid));
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
      debugPrint(uIdConst);
      changeUIdDone = true;
      emit(ChangeUIdDoneState());
    });
  }
}
