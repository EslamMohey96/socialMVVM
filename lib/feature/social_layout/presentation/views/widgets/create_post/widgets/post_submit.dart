import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/social_layout.dart';

class PostSubmit extends StatelessWidget {
  const PostSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(cubit.userModel!.image),
            ),
            sizeBoxW(20),
            Text(
              cubit.userModel!.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                if (cubit.formKeyPost.currentState!.validate()) {
                  cubit.createPost();
                  cubit.filePostImage = '';
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SocialLayout()),
                  );
                }
              },
              child: const Text(
                "Post",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        );
      },
    );
  }
}
