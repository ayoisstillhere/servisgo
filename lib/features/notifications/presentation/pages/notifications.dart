import 'package:flutter/material.dart';

import '../widgets/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
      body: const NotificationsBody(),
    );
  }
}

