import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class SocialBottomNavigationBar extends StatelessWidget {
  const SocialBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
        listener: (BuildContext context, SocialState state) {},
        builder: (BuildContext context, SocialState state) {
          return BottomNavyBar(
            backgroundColor: Colors.black,
            selectedIndex: cubit.currentIndex,
            onItemSelected: (value) => cubit.changeCurrentIndex(value),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  icon: const Icon(IconBroken.Home),
                  title: const Text("Home"),
                  activeColor: Colors.red),
              BottomNavyBarItem(
                  icon: const Icon(IconBroken.Chat),
                  title: const Text('Chats'),
                  activeColor: Colors.red),
              BottomNavyBarItem(
                  icon: const Icon(IconBroken.User),
                  title: const Text('Users'),
                  activeColor: Colors.red),
            ],
          );
        });
  }
}
