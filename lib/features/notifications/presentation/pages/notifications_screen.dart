import 'package:flutter/material.dart';

import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

import '../widgets/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
            ),
          ),
        ],
      ),
      // body: const NoNotificationsBody(),
      body: NotificationsBody(currentUser: currentUser),
    );
  }
}
