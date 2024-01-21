import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

class SocialBottomNavigationBar extends StatelessWidget {
  const SocialBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
