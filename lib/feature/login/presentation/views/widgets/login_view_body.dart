import 'package:flutter/material.dart';
import 'package:social/feature/login/presentation/views/widgets/do_not_have_account.dart';
import 'package:social/feature/login/presentation/views/widgets/logIn_button.dart';
import 'package:social/feature/login/presentation/views/widgets/login_text_field.dart';
import 'package:social/feature/login/presentation/views/widgets/text_welcome.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      alignment: Alignment.center,
      child:const SingleChildScrollView(
        child: Column(
          children: [
            TextWelcome(str: 'Log in'),
            LoginTextField(),
            LogInButton(),
            DoNotHaveAccount(),
          ],
        ),
      ),
    );
  }
}
