import 'package:flutter/material.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class UserAccountsHeader extends StatelessWidget {
  const UserAccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
         SocialCubit.get(context).userModel!.name,
        style: const TextStyle(color: Colors.black),
      ),
      accountEmail: Text(
         SocialCubit.get(context).userModel!.email,
        style: const TextStyle(color: Colors.black),
      ),
      currentAccountPicture: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
           SocialCubit.get(context).userModel!.image,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        image: DecorationImage(
          image: NetworkImage( SocialCubit.get(context).userModel!.background),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
