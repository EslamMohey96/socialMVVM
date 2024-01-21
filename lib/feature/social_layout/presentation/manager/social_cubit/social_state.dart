part of 'social_cubit.dart';

@immutable
sealed class SocialState {}

final class SocialInitial extends SocialState {}

// changeNavState
class ChangeNavState extends SocialState {}

// GetUserData
class UserDataLoadingState extends SocialState {}

class UserDataSuccessState extends SocialState {}

class UserDataErrorState extends SocialState {
  late final dynamic error;
  UserDataErrorState(this.error) {
    toastMessage(message: error);
  }
}

// GetMassages
class GetMassageSuccessState extends SocialState {}

class GetMassageErrorState extends SocialState {
  late final dynamic error;
  GetMassageErrorState(this.error) {
    toastMessage(message: error);
  }
}

// SendMassage
class SendMassageSuccessState extends SocialState {}

class SendMassageErrorState extends SocialState {
  late final dynamic error;
  SendMassageErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Get Users
class UsersLoadingState extends SocialState {}

class UsersSuccessState extends SocialState {}

class UsersErrorState extends SocialState {
  late final dynamic error;
  UsersErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Update User Data
class UpdateUserDataLoadingState extends SocialState {}

class UpdateUserDataSuccessState extends SocialState {}

class UpdateUserDataErrorState extends SocialState {
  late final dynamic error;
  UpdateUserDataErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Get Posts States
class MyPostsLoadingState extends SocialState {}

class MyPostsSuccessState extends SocialState {}

class MyPostsErrorState extends SocialState {
  late final dynamic error;
  MyPostsErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Create Post Error
class CreatePostErrorState extends SocialState {
  late final dynamic error;
  CreatePostErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Profile Image states
class ProfileImageSuccessState extends SocialState {}

class ProfileImageErrorState extends SocialState {
  late final dynamic error;
  ProfileImageErrorState(this.error) {
    toastMessage(message: error);
  }
}

// Cover Image states
class CoverImageSuccessState extends SocialState {}

class CoverImageErrorState extends SocialState {
  late final dynamic error;
  CoverImageErrorState(this.error) {
    toastMessage(message: error);
  }
}

// post Image states
class GetPostImageLoading extends SocialState {}

class PostImageSuccessState extends SocialState {}

class PostImageErrorState extends SocialState {
  late final dynamic error;
  PostImageErrorState(this.error) {
    toastMessage(message: error);
  }
}
