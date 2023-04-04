import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/constants.dart';
import 'package:servisgo/size_config.dart';

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(180)),
            SvgPicture.asset(
              "assets/images/notifiBell.svg",
              // ignore: deprecated_member_use
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      : kGreys,
            ),
            SizedBox(height: getProportionateScreenHeight(32)),
            Text(
              "Ooops, no notifications yet!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kGreys),
            ),
          ],
        ),
      ),
    );
  }
}
