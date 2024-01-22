import 'package:flutter/material.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/settings_screen/widgets/user_info.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/menu/settings_screen/widgets/user_react.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const UserInfo(),
          sizeBoxH(20),
          const UserReact(),
        ],
      ),
    );
  }
}
