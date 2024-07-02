
import 'package:flutter/material.dart';
import 'package:wafed/helper/utils.dart';
import 'package:wafed/models/user.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    required this.usersList,
    required this.userEmail,
  });

  final List<User> usersList;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(
                findUserPhoto(usersList, userEmail)),
          ),
          borderRadius: BorderRadius.circular(200)),
    );
  }
}