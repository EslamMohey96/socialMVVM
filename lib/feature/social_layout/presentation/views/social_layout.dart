import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/drawer/drawer.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/social_body.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/social_bottom_navigation_bar.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
        listener: (BuildContext context, SocialState state) {},
        builder: (BuildContext context, SocialState state) {
          return Scaffold(
            drawer: const DrawerBody(),
            appBar: AppBar(
              title: Text(
                SocialCubit.get(context).titles[SocialCubit.get(context).currentIndex],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconBroken.Notification),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconBroken.Search),
                ),
              ],
            ),
            body: const SocialBody(),
            bottomNavigationBar: const SocialBottomNavigationBar(),
          );
        });
  }
}
