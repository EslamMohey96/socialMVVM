import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:social/constants.dart';
import 'package:social/core/shared_components/custom_toast_message.dart';
import 'package:social/feature/register/data/models/user_model.dart';
import 'package:social/feature/social_layout/data/models/massageModel.dart';
import 'package:social/feature/social_layout/data/models/postModel.dart';
import 'package:social/feature/social_layout/data/repo/upload_image/upload_image_repo_implement.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/settings_screen/settings.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/chats_screen/chats.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/feeds_screen/feeds.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/users_screen/users.dart';

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

//profileImage
  String fileProfileImage = '';
  String filePostImage = '';
  String fileCoverImage = '';
  XFile? image;
  Future<String?> getImage() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    return await UploadImage().upload(xFile: image).then((value) {
      return value.fold((err) {
        ProfileImageErrorState(err.message);
        return '';
      }, (success) {
        emit(ProfileImageSuccessState());
        return success;
      });
    });
  }

// ----------------------------------------------------------------------------

// createPost
  void createPost() async {
    try {
      postModel post = postModel(
        uId: uIdConst,
        name: userModel!.name,
        image: userModel!.image,
        postText: postController.text,
        postImage: filePostImage,
        date: DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()).toString(),
      );
      await FirebaseFirestore.instance
          .collection('myPosts')
          .doc()
          .set(post.toMap());
      // .then((value) => getMyPosts(uIdConst)
      // );
    } on FirebaseAuthException catch (e) {
      emit(CreatePostErrorState(e.message));
    }
  }

// getPosts
  late List<postModel> myPosts = [];
  late List<postModel> posts = [];
  int myPostsDone = 0;
  String welcomeImage = '';
  void getMyPosts() {
    try {
      myPostsDone = 0;
      emit(MyPostsLoadingState());
      FirebaseFirestore.instance
          .collection('myPosts')
          .orderBy('date')
          .snapshots()
          .listen((event) {
        myPosts = [];
        for (var element in event.docs) {
          myPosts.add(postModel.fromJson(element.data()));
        }
        postController.text = '';
        emit(MyPostsSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      emit(MyPostsErrorState(e.message));
    }
  }

// updateUserData
  int updateUserDataCounter = 1;
  void updateUserData() async {
    try {
      userModelDone = 0;
      emit(UpdateUserDataLoadingState());
      await FirebaseFirestore.instance.collection('users').doc(uIdConst).set({
        "name": nameController.text,
        "bio": bioController.text,
        "email": userModel!.email,
        "phone": phoneController.text,
        "isEmailVerified": false,
        "uId": userModel!.uId,
        "background":
            fileCoverImage == '' ? userModel!.background : fileCoverImage,
        "image": fileProfileImage == '' ? userModel!.image : fileProfileImage,
      }).then((value) {
        emit(UpdateUserDataSuccessState());
        getUserData(uIdConst);
      });
    } on FirebaseAuthException catch (e) {
      emit(UpdateUserDataErrorState(e.message));
    }
  }

// getUserData
  UserModel? userModel;
  int userModelDone = 0;
  void getUserData(String uId) async {
    try {
      userModelDone = 0;
      emit(UserDataLoadingState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        userModel = UserModel.fromJson(value.data());
      }).then((value) {
        fileProfileImage = userModel!.image;
        fileCoverImage = userModel!.background;
        nameController = TextEditingController(text: userModel!.name);
        bioController = TextEditingController(text: userModel!.bio);
        phoneController = TextEditingController(text: userModel!.phone);
        userModelDone = 1;
        emit(UserDataSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      emit(UserDataErrorState(e.message));
    }
  }

// getUsers
  List<UserModel>? users = [];
  int usersListDone = 0;
  void getUsers() {
    try {
      users = [];
      emit(UsersLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((event) {
        users = [];
        for (var element in event.docs) {
          if (element.id != uIdConst) {
            users!.add(UserModel.fromJson(element.data()));
          }
          usersListDone = 1;
          emit(UsersSuccessState());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(UsersErrorState(e.message));
    }
  }

// sendMassage
  void sendMassage({
    required String receiver,
    required String text,
  }) async {
    try {
      // String date =
      //     DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()).toString();
      chatController.text = '';
      // print(date);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel!.uId)
          .collection('chats')
          .doc(receiver)
          .collection('massages')
          .add({
        'date':
            DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()).toString(),
        'sender': userModel!.uId,
        'receiver': receiver,
        'text': text,
      }).then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(receiver)
            .collection('chats')
            .doc(userModel!.uId)
            .collection('massages')
            .add({
          'date': DateFormat('yyyy-MM-dd hh:mm:ss')
              .format(DateTime.now())
              .toString(),
          'sender': userModel!.uId,
          'receiver': receiver,
          'text': text,
        }).then((value) {
          emit(SendMassageSuccessState());
        });
      });
    } on FirebaseAuthException catch (e) {
      emit(SendMassageErrorState(e.message));
    }
  }

// getMassages
  List<massageModel> massagesList = [];
  void getMassage({
    required String receiver,
  }) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel!.uId)
          .collection('chats')
          .doc(receiver)
          .collection("massages")
          .orderBy("date")
          .snapshots()
          .listen((event) {
        massagesList = [];
        for (var element in event.docs) {
          massagesList.add(massageModel.fromJson(element.data()));
          emit(GetMassageSuccessState());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(GetMassageErrorState(e.message));
    }
  }

  // changeNavState
  int currentIndex = 0;
  List<Widget> screens = [
    const Feeds(),
    const Chats(),
    const UsersScreen(),
    const UserSettings(),
  ];
  List<String> titles = [
    "Feeds",
    "Chats",
    "Users",
    "Settings",
  ];
  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeNavState());
  }
}
