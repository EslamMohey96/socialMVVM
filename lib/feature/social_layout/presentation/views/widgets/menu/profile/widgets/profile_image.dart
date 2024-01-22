import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (BuildContext context, SocialState state) {},
      builder: (BuildContext context, SocialState state) {
        SocialCubit cubit = SocialCubit.get(context);
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 53,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: cubit.fileProfileImage == ''
                    ? NetworkImage(
                        cubit.userModel!.image,
                      )
                    :NetworkImage(
                        cubit.fileProfileImage,
                      )
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0),
              radius: 20,
              child: IconButton(
                onPressed: () async {
                  cubit.fileProfileImage=(await cubit.getImage()).toString();
                },
                icon: const Icon(
                  IconBroken.Camera,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
