import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (BuildContext context, SocialState state) {},
      builder: (BuildContext context, SocialState state) {
        SocialCubit cubit = SocialCubit.get(context);
        return Container(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
            ),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.updateUserData();
              }
            },

            child: const Text(
              "Update",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            //
          ),
        );
      },
    );
  }
}
