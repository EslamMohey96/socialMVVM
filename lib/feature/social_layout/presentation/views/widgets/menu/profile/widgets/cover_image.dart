import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (BuildContext context, SocialState state) {},
      builder: (BuildContext context, SocialState state) {
        SocialCubit cubit = SocialCubit.get(context);
        return Stack(
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
                    image: cubit.fileCoverImage == ''
                        ? NetworkImage(
                            cubit.userModel!.background,
                          )
                        : NetworkImage(
                        cubit.fileCoverImage,
                      ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0),
                radius: 20,
                child: IconButton(
                  onPressed: () async{
                    cubit.fileCoverImage=(await cubit.getImage()).toString();
                  },
                  icon: const Icon(
                    IconBroken.Camera,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
