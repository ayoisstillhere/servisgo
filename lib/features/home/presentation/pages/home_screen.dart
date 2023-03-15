import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/constants.dart';
import 'package:servisgo/size_config.dart';

import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(32),
            ).copyWith(
                top: getProportionateScreenHeight(48),
                bottom: getProportionateScreenHeight(18)),
            color: kPrimaryColor,
            height: getProportionateScreenHeight(128),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Ayodele Fagbami!",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: kBgColor),
                    ),
                    SizedBox(height: getProportionateScreenHeight(4)),
                    Text(
                      "What do you need done today?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: kBgColor),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/icons/Notifications.svg"),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(156),
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(27),
                        horizontal: getProportionateScreenWidth(16),
                      ),
                      decoration: BoxDecoration(
                        color: kCallToAction,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FIRST TIME DISCOUNT!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: kBgColor),
                          ),
                          Text(
                            "10% OFF",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: kBgColor),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(4),
                                vertical: getProportionateScreenHeight(8)),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(4)),
                            ),
                            child: Text(
                              "ORDER NOW",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: kBgColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: getProportionateScreenWidth(152),
                      child: Image.asset(
                        "assets/images/cleanerNobg.png",
                        height: getProportionateScreenHeight(120),
                        width: getProportionateScreenWidth(159.49),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(28),
                ),
                Text(
                  "Our Services",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kBlacks,
                      ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget> [
                      Container(
                        child: ,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
