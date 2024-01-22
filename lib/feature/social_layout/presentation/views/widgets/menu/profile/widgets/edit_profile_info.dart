import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/core/shared_components/custom_text_form_field.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class EditProfileInfo extends StatelessWidget {
  const EditProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (BuildContext context, SocialState state) {},
      builder: (BuildContext context, SocialState state) {
        SocialCubit cubit = SocialCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is UpdateUserDataLoadingState)
                  const LinearProgressIndicator(
                    color: Colors.red,
                  ),
                sizeBoxH(10),
                textFormField(
                  context: context,
                  controller: cubit.nameController,
                  textInputType: TextInputType.text,
                  labelText: "Name",
                  prefixIcon: const Icon(IconBroken.Profile),
                  valid: (value) {
                    if (value!.isEmpty) {
                      return 'User Name must\'n be empty ';
                    }
                    return null;
                  },
                ),
                sizeBoxH(10),
                textFormField(
                  context: context,
                  controller: cubit.bioController,
                  textInputType: TextInputType.text,
                  labelText:
                      //

                      "Bio",
                  prefixIcon: const Icon(IconBroken.Info_Circle),
                  valid: (value) {
                    if (value!.isEmpty) {
                      value = "";
                    }
                    return null;
                  },
                ),
                sizeBoxH(10),
                textFormField(
                  context: context,
                  controller: cubit.phoneController,
                  textInputType: TextInputType.phone,
                  labelText: "phone number",
                  prefixIcon: const Icon(IconBroken.Call),
                  valid: (value) {
                    if (value!.isEmpty) {
                      return 'phone number must\'n be empty ';
                    }
                    return null;
                  },
                ),
                sizeBoxH(10),
              ],
            ),
          ),
        );
      },
    );
  }
}
