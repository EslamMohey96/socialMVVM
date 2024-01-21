part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogInVisiblePasswordState extends LoginState {}

class ChangeConstraintsState extends LoginState {}

class ChangeUIdDoneState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  late final String uId;
  LoginSuccessState(this.uId);
}

final class LoginErrorState extends LoginState {
  late final FirebaseException  error;
  LoginErrorState(this.error) {
    switch (error.code) {
            case 'invalid-credential':
              toastMessage(message: error.message);
              break;
            case 'invalid-email':
              toastMessage(message: error.message);
              break;
            case 'too-many-requests':
              toastMessage(message: error.message);              
              break;
            default:
              toastMessage(message: error.message);
          }
  }
}
