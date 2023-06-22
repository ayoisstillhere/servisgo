import 'package:flutter/material.dart';

import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

import '../../../../size_config.dart';
import 'notifications_box.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    final List icons = [
      "assets/icons/Iconly/Broken/Lock.svg",
      "assets/icons/Iconly/Broken/Send.svg",
      "assets/icons/Iconly/Broken/Star.svg",
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NotificationsBox(
              icons: icons,
              currentUser: currentUser,
            ),
            SizedBox(height: getProportionateScreenHeight(36)),
            NotificationsBox(
              icons: icons,
              currentUser: currentUser,
            ),
          ],
        ),
      ),
    );
  }
}
