import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social/core/shared_components/size_box.dart';
import 'package:social/feature/register/data/models/user_model.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';

class ChatDetails extends StatelessWidget {
  final UserModel userModel;

  const ChatDetails({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    SocialCubit cubit = SocialCubit.get(context);
    return Builder(
      builder: (context) {
        cubit.getMassage(receiver: userModel.uId);
        return BlocConsumer<SocialCubit, SocialState>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userModel.image),
                    ),
                    sizeBoxW(15),
                    Text(
                      userModel.name,
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 16,
                      child: ListView.separated(
                        // controller: scrollController,
                        itemBuilder: (context, index) {
                          if (cubit.massagesList[index].receiver ==
                              cubit.userModel!.uId) {
                            return hisMessage(cubit.massagesList[index]);
                          } else {
                            return myMessage(cubit.massagesList[index]);
                          }
                        },
                        separatorBuilder: (context, index) => sizeBoxH(10),
                        itemCount: cubit.massagesList.length,
                      ),
                    ),
                    sizeBoxH(10),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cubit.chatController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '  type your massage',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Container(
                            height: 55,
                            color: Colors.red,
                            child: MaterialButton(
                              minWidth: 1,
                              onPressed: () {
                                cubit.sendMassage(
                                  receiver: userModel.uId,
                                  text: cubit.chatController.text,
                                );
                              },
                              child: const Icon(IconBroken.Send),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget hisMessage(message) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )),
        child: Text(
          message.text,
        ),
      ),
    );
  }

  Widget myMessage(message) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )),
        child: Text(
          message.text,
        ),
      ),
    );
  }
}
