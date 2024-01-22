import 'package:flutter/material.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/feeds_screen/widgets/create_post_field.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/feeds_screen/widgets/posts.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/nav_bar/feeds_screen/widgets/welcome_banner.dart';

class Feeds extends StatelessWidget {
  const Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialCubit.get(context).userModelDone == 0
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                const WelcomeBanner(),
                sizeBoxH(15),
                const CreatePostField(),
                sizeBoxH(15),
                const Posts(),
              ],
            ),
          );
  }
}
