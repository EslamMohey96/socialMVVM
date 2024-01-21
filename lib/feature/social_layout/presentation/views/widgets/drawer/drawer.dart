import 'package:flutter/material.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/drawer/drawer_list_tile.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/drawer/user_accounts_drawer_header.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: cubit.user_model_Done == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :  ListView(
              padding: EdgeInsets.zero,
              children:const [
                UserAccountsHeader(),
                 DrawerListTile(),
              ],
            ),
    );
  }
}
