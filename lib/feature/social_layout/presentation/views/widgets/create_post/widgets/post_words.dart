import 'package:flutter/material.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class PostWords extends StatelessWidget {
  const PostWords({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Form(
        key: SocialCubit.get(context).formKeyPost,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          expands: true,
          maxLines: null,
          controller: SocialCubit.get(context).postController,
          decoration: const InputDecoration(
              hintText: "what is in your mind ...",
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none),
          validator: (value) {
            if (value!.isEmpty &&
                (SocialCubit.get(context).filePostImage == '')) {
              return 'please write something or add a photo';
            }
            return null;
          },
          onTap: () {},
        ),
      ),
    );
  }
}
