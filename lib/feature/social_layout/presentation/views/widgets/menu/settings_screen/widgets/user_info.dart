import 'package:flutter/material.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 190,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            SocialCubit.get(context).userModel!.background,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                CircleAvatar(
                  radius: 53,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      SocialCubit.get(context).userModel!.image,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            SocialCubit.get(context).userModel!.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            SocialCubit.get(context).userModel!.bio,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),

      ],
    );
  }
}