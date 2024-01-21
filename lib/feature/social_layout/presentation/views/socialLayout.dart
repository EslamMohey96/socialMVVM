import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/drawer/drawer.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/social_app_bar.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/social_body.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/social_bottom_navigation_bar.dart';
import 'package:social_app/modules/socialLayout/menu/settingsScreen/seetings.dart';
import 'package:social_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:social_app/modules/userScreens/profile/editProfile.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:social_app/shared/cubit/socialCubit/socialCubit.dart';
import 'package:social_app/shared/cubit/socialCubit/socialStates.dart';
import 'package:social_app/shared/network/local/cacheHelper.dart';

class socialLayout extends StatelessWidget {
  const socialLayout({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = socialCubit.get(context);
    return BlocConsumer<socialCubit, socialStates>(
        listener: (BuildContext context, socialStates state) {},
        builder: (BuildContext context, socialStates state) {
          return const Scaffold(
            drawer: DrawerBody(),
            appBar: SocialAppBar(),
            body:  SocialBody(),
            bottomNavigationBar: SocialBottomNavigationBar(),          );
        });
  }
}
