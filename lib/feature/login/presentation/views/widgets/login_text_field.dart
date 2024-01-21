import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/core/shared_components/custom_text_form_field.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              FadeInRight(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: SizedBox(
                  // width: cubit.constraints! > 350 ? 350 : double.infinity,
                  child: textFormField(
                    context: context,
                    controller: cubit.emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: "Email Address",
                    prefixIcon: const Icon(IconBroken.Profile),
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'email must\'n be empty ';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              sizeBoxH(20),
              FadeInLeft(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 1500),
                child: SizedBox(
                  // width: cubit.constraints! > 350 ? 350 : double.infinity,
                  child: textFormField(
                    context: context,
                    controller: cubit.passwordController,
                    textInputType: TextInputType.visiblePassword,
                    visible: !cubit.visiblePassword,
                    labelText: "Password",
                    prefixIcon: const Icon(IconBroken.Lock),
                    suffixIcon: cubit.visiblePassword
                        ? const Icon(Icons.visibility_sharp)
                        : const Icon(Icons.visibility_off_sharp),
                    suffixPressed: () {
                      cubit.changeVisiblePassword(!cubit.visiblePassword);
                    },
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'password must\'n be empty ';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              sizeBoxH(20),
            ],
          ),
        );
      },
    );
  }
}
