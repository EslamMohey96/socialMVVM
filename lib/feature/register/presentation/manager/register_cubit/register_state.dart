part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ChangeUIdDoneState extends RegisterState {}

final class RegisterVisiblePasswordState extends RegisterState {}


//Registration
final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
    late final FirebaseException error;
  RegisterErrorState(this.error) {
    switch (error.code) {
                case 'weak-password':
                 toastMessage(message: error.message);
                  break;
                case 'invalid-email':
                  toastMessage(message: error.message);
                  break;
                case 'email-already-in-use':
                 toastMessage(message: error.message);
                  break;
                case 'too-many-requests':
                 toastMessage(message: error.message);
                  break;
                default:
                  toastMessage(message: error.message);
              }
    // toastMessage(message: error);
  }
}


// setting user data
final class UserDataRegLoadingState extends RegisterState {}

final class UserDataRegSuccessState extends RegisterState {}

final class UserDataRegErrorState extends RegisterState {
  late final dynamic error;
  UserDataRegErrorState(this.error) {
    // toastMessage(message: error);
    debugPrint(error);
  }
}