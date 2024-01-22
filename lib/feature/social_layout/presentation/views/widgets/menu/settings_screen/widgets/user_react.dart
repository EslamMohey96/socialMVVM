import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class UserReact extends StatelessWidget {
  const UserReact({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Row(
          children: [
            details(number: "${cubit.myPosts.length}", func:  () {}, name: "Posts"),
            details(number: "250", func:  () {}, name: "Photo"),
            details(number: "250", func:  () {}, name: "Followers"),
            details(number: "250", func:  () {}, name: "Following"),
                      ],
        );
      },
    );
  }

  Widget details({required  number,required func,required name}) {
    return Expanded(
      child: InkWell(
        onTap:func,
        child:  Column(
          children: [
            Text(
             number,
              style:const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              name,
              style:const TextStyle(fontSize: 17, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
