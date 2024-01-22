import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        SocialCubit.get(context).filePostImage=(await SocialCubit.get(context).getImage()).toString();
      },
      child: Row(
        children: [
          const Icon(
            IconBroken.Image,
            color: Colors.red,
          ),
          sizeBoxW(5),
          const Text(
            "add photo",
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
