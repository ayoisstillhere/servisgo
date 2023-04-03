import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../components/nav_page.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class NoResultsBody extends StatelessWidget {
  const NoResultsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(32),
      ).copyWith(
        top: getProportionateScreenHeight(88),
      ),
      child: Column(
        children: [
          SvgPicture.asset("assets/images/notFound.svg"),
          SizedBox(height: getProportionateScreenHeight(60)),
          Text(
            "No Results",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: primaryColor),
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          Text(
            "Seems like you don’t have any active bookings at the moment",
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(color: kGreys),
          ),
          SizedBox(height: getProportionateScreenHeight(32)),
          DefaultButton(
            text: "Return Home",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavPage()));
            },
          ),
        ],
      ),
    );
  }
}
