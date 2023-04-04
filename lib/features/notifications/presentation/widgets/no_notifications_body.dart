
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class NoNotificationsBody extends StatelessWidget {
  const NoNotificationsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
