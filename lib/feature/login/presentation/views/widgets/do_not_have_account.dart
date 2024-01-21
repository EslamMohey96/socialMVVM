import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social/feature/register/presentation/views/register_view.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FadeInUp(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 1500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account?"),
                TextButton(
                  onPressed: () {
                    cubit.emailController.text = '';
                    cubit.passwordController.text = '';
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>const RegisterView()),
                    );
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
