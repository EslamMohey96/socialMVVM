import 'package:flutter/material.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/widgets/create_post/create_post.dart';

class CreatePostField extends StatelessWidget {
  const CreatePostField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.grey.withOpacity(0.3),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          padding:const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(SocialCubit.get(context).userModel!.image),
                  ),
                  sizeBoxW(10),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding:const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child:const Text(
                          "write a post",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const CreatePost()),
                        );
                      },
                    ),
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
