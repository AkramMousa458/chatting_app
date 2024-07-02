// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafed/Screens/Chat/chat_screen.dart';
import 'package:wafed/Screens/Chat/widgets/confirm_dialog_box.dart';
import 'package:wafed/Screens/Chat/widgets/profile_photo_widget.dart';
import 'package:wafed/Screens/Chat/widgets/user_widget.dart';
import 'package:wafed/constants.dart';
import 'package:wafed/cubits/chat_cubit/chat_cubit.dart';
import 'package:wafed/cubits/login_cubit/login_cubit.dart';
import 'package:wafed/helper/shared_preferences.dart';
import 'package:wafed/helper/utils.dart';
import 'package:wafed/models/screen_args.dart';
import 'package:wafed/models/user.dart';

class PeopleScreen extends StatelessWidget {
  PeopleScreen({super.key});

  static String id = 'PeopleScreen';

  final CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  final CacheData cacheData = CacheData();

  @override
  Widget build(BuildContext context) {
    String userEmail = BlocProvider.of<LoginCubit>(context).userEmail;
    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> usersList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              usersList.add(User.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: kPrimaryColor,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.2),
                        // offset: const Offset(
                        //   0.0,
                        //   10.0,
                        // ),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    confirmDialogBox(
                        context: context,
                        onTap: () {
                          cacheData.removeEmail();
                          cacheData.removePassword();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        title: "Logout",
                        body: 'Are you sure want logout?',
                        no: 'Cancel',
                        confirm: 'Logout');
                  },
                  icon: Transform.scale(
                    scaleX: -1,
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    Row(
                      children: [
                        ProfilePhotoWidget(
                            usersList: usersList, userEmail: userEmail),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              findUserName(usersList, userEmail),
                              style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              findUserStatues(usersList, userEmail),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Chats',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black45.withOpacity(0.2),
                        //     offset: const Offset(
                        //       0.0,
                        //       10.0,
                        //     ),
                        //     blurRadius: 15.0,
                        //     spreadRadius: 5.0,
                        //   ),
                        // ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: usersList.length,
                              itemBuilder: (context, index) {
                                return MaterialButton(
                                  onPressed: () {
                                    BlocProvider.of<ChatCubit>(context)
                                        .getMessages(
                                            context: context,
                                            userEmail: userEmail,
                                            friendEmail:
                                                usersList[index].email);
                                    Navigator.pushNamed(
                                      context,
                                      ChatScreen.id,
                                      arguments: ScreenArgs(
                                        userEmail: userEmail,
                                        friendName: usersList[index].name,
                                        friendEmail: usersList[index].email,
                                        friendPhoto: usersList[index].photo,
                                      ),
                                    );
                                  },
                                  child: UserWidget(
                                      user: usersList[index],
                                      userName:
                                          findUserName(usersList, userEmail)),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Loading Chats'),
              ),
            );
          }
        });
  }
}
