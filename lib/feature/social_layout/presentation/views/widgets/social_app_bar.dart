import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

class SocialAppBar extends StatelessWidget {
   SocialAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        cubit.titles[cubit.currentIndex],
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
    );
  }
}
