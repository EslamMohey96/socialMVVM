import 'package:flutter/material.dart';
import 'package:social/feature/register/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
        backgroundColor: Colors.black,
        body: RegisterViewBody(),
    );
  }
}