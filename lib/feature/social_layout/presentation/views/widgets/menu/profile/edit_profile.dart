import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/profile/widgets/cover_image.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/profile/widgets/edit_profile_info.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/profile/widgets/profile_image.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/profile/widgets/submit_button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (BuildContext context, SocialState state) {},
      builder: (BuildContext context, SocialState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "edit profile",
            ),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 190,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CoverImage(),
                      ProfileImage(),
                    ],
                  ),
                ),
                EditProfileInfo(),
                SubmitButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
