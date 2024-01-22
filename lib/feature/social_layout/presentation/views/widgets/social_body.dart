import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class SocialBody extends StatelessWidget {
  const SocialBody({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialState>(
        listener: (BuildContext context, SocialState state) {},
        builder: (BuildContext context, SocialState state) {
          return cubit.userModelDone == 0
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : cubit.screens[cubit.currentIndex];
        });
  }
}
