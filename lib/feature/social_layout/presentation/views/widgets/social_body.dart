import 'package:flutter/material.dart';

class SocialBody extends StatelessWidget {
  const SocialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return cubit.user_model_Done == 0
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : cubit.screens[cubit.currentIndex];
  }
}
