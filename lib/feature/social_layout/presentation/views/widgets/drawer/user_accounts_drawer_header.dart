import 'package:flutter/material.dart';

class UserAccountsHeader extends StatelessWidget {
  const UserAccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        cubit.user_model!.name,
        style: const TextStyle(color: Colors.black),
      ),
      accountEmail: Text(
        cubit.user_model!.email,
        style: const TextStyle(color: Colors.black),
      ),
      currentAccountPicture: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          cubit.user_model!.image,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        image: DecorationImage(
          image: NetworkImage(cubit.user_model!.background),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
