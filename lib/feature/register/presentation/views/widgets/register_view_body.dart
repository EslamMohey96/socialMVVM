import 'package:flutter/material.dart';
import 'package:social/feature/login/presentation/views/widgets/text_welcome.dart';
import 'package:social/feature/register/presentation/views/widgets/register_button.dart';
import 'package:social/feature/register/presentation/views/widgets/register_text_field.dart';
import 'package:social/feature/register/presentation/views/widgets/you_have_account.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child:const SingleChildScrollView(
        child: Column(
          children: [
            TextWelcome(str: 'Sign up'),
            RegisterTextField(),
            RegisterButton(),
            YouHaveAccount(),
          ],
        ),
      ),
    );
  }
}
