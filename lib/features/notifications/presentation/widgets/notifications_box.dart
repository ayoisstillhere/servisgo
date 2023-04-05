
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'notifications_row.dart';

class NotificationsBox extends StatelessWidget {
  const NotificationsBox({
    super.key,
    required this.icons,
  });

  final List icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kGreys,
              ),
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(24),
          ),
          height: getProportionateScreenHeight(250),
          width: double.infinity,
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: kOutlineVariant,
            //   width: 1,
            // ),
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? kDarkBgColor
                : kBgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, 8),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NotificationRow(
                icon: icons[0],
                text: "Ayodele, Your password has been successfully reset",
              ),
              const Divider(),
              NotificationRow(
                icon: icons[1],
                text: "Service Provider has arrived has been delivered.",
              ),
              const Divider(),
              NotificationRow(
                icon: icons[2],
                text: "Rate Our Service Provider",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
