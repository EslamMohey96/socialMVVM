import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Image(
          image: NetworkImage(
            cubit.filePostImage,
          ),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
