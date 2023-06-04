import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'notifications_box.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

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
            NotificationsBox(icons: icons),
            SizedBox(height: getProportionateScreenHeight(36)),
            NotificationsBox(icons: icons),
          ],
        ),
      ),
    );
  }
}
