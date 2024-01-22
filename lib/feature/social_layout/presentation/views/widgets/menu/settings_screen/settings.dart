import 'package:flutter/material.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/settings_screen/widgets/setting_body.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SocialCubit.get(context).userModelDone != 0
          ? const SettingBody()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
