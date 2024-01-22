import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return Builder(
      builder: (context) {
        cubit.getUsers();
        return BlocConsumer<SocialCubit, SocialState>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            return SingleChildScrollView(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    userProfile(cubit.users![index]),
                separatorBuilder: (context, index) => sizeBoxH(10),
                itemCount: cubit.users!.length,
              ),
            );
          }),
        );
      },
    );
  }

  Widget userProfile(userModel) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.grey.withOpacity(0.3),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(userModel.image),
                  ),
                  sizeBoxW(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
