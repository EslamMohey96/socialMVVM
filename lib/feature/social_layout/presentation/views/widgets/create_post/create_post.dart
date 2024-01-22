import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/create_post/widgets/image_picker_button.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/create_post/widgets/post_image.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/create_post/widgets/post_submit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/create_post/widgets/post_words.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const PostSubmit(),
                sizeBoxH(20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const PostWords(),
                        sizeBoxH(20),
                        if (state is GetPostImageLoading)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (cubit.filePostImage != '') const PostImage(),
                      ],
                    ),
                  ),
                ),
                const ImagePickerButton(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
