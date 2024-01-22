import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return Builder(builder: (context) {
      cubit.getMyPosts();
      return BlocConsumer<SocialCubit, SocialState>(
          listener: ((context, state) {}),
          builder: (context, state) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => postWidget(cubit.myPosts[index]),
              separatorBuilder: (context, index) => sizeBoxH(10),
              itemCount: cubit.myPosts.length,
            );
          });
    });
  }

  Widget postWidget(postModel) {
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
                    backgroundImage: NetworkImage(postModel.image),
                  ),
                  sizeBoxW(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModel.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizeBoxH(5),
                      Text(
                        postModel.date,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    color: Colors.red,
                    onPressed: () {},
                    icon: const Icon(IconBroken.More_Circle),
                  ),
                  sizeBoxW(10),
                ],
              ),
              sizeBoxH(15),
              if (postModel.postText != '')
                Text(
                  postModel.postText,
                  style: const TextStyle(fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              sizeBoxH(10),
              if (postModel.postImage != '')
                Image(
                    image: NetworkImage(
                      postModel.postImage,
                    ),
                    fit: BoxFit.cover),
              sizeBoxH(10),
              Row(
                children: [
                  sizeBoxW(5),
                  InkWell(
                    child: const Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.comment,
                          color: Colors.red,
                        ),
                        Text(
                          "5 comments",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  sizeBoxW(5),
                ],
              ),
              sizeBoxH(10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(postModel!.image),
                  ),
                  sizeBoxW(10),
                  Expanded(
                      child: InkWell(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "write to comment",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  )),
                  // Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.Heart,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
