import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/feature/login/presentation/views/login_view.dart';
import 'package:social/feature/register/presentation/manager/register_cubit/register_cubit.dart';

class YouHaveAccount extends StatelessWidget {
  const YouHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context, state){

      },
      builder: (context, state) {
        return  FadeInUp(
      delay:const Duration(milliseconds: 300),
      duration:const Duration(milliseconds: 1500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text(
            "you have an account?",
            style:  TextStyle(fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              cubit.emailController.text = '';
              cubit.nameController.text = '';
              cubit.passwordController.text = '';
              cubit.phoneController.text = '';
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>const LoginView()),
              );
            },
            child:const Text(
              'Sign In',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          )
        ],
      ),
    );

      },
    );
  }
}
