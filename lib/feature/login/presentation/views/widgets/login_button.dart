import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/core/shared_components/customButton.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ChangeUIdDoneState) {
          Fluttertoast.showToast(
            msg: "Login done successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          LoginCubit.get(context).emailController.text = '';
          LoginCubit.get(context).passwordController.text = '';
          // Navigator.pushAndRemoveUntil(

          // context,
          // MaterialPageRoute(builder: (context) => socialLayout()),
          // (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1500),
              child: Container(
                // width: cubit.constraints! > 350 ? 350 : double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: customButton(
                  function: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.userLogin(
                        context: context,
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                      );
                    }
                  },
                  widget: const Text("LogIn"),
                ),
              ),
            ),
            sizeBoxH(20),
          ],
        );
      },
    );
  }
}
