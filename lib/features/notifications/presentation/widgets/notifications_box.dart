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
                ? const Color(0xFF2A2A2A)
                : kBgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? const BoxShadow(
                      color: Colors.transparent,
                    )
                  : BoxShadow(
                      color: kBlacks.withOpacity(0.06),
                      spreadRadius: 0,
                      blurRadius: 30,
                      offset: const Offset(0, 8),
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
