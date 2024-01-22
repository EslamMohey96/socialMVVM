import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/constants.dart';
import 'package:social/core/utils/cacheHelper.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social/feature/login/presentation/views/login_view.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/profile/edit_profile.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/settings_screen/settings.dart';


class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(IconBroken.Edit_Square),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Edit Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const EditProfile()),
            );
          },
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(IconBroken.Heart),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Favorites'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(Icons.person),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Friends'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(IconBroken.Setting),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Settings'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UserSettings()),
            );
          },
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(
            Icons.brightness_6_outlined,
          ),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Dark Mode'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(
            Icons.language,
          ),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Language'),
          onTap: () {},
        ),
        ListTile(
          iconColor: Colors.red,
          textColor: Colors.white,
          leading: const Icon(IconBroken.Logout),
          title: const Text(
              style: TextStyle(
                fontSize: 15,
              ),
              'Logout'),
          onTap: () {
            cacheHelper
                .setData(
              key: 'uId',
              value: '',
            )
                .then((value) {
              uIdConst = cacheHelper.getData(
                key: 'uId',
              );
            }).then((value) {
              LoginCubit.get(context).changeUIdDone = false;
              SocialCubit.get(context).currentIndex = 0;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (Route<dynamic> route) => false);
            });
          },
        ),
      ],
    );
  }
}
