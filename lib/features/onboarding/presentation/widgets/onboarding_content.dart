import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.text,
    required this.index,
    required this.image,
    required this.header,
  }) : super(key: key);
  final String? image, header, text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bgColor = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? kDarkBgColor
        : kBgColor;
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            image!,
            height: getProportionateScreenHeight(407.26),
            width: getProportionateScreenWidth(202.68),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(288)),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.91),
                  blurRadius: 25,
                  offset: const Offset(0, -50),
                ),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16),
                          vertical: getProportionateScreenHeight(8),
                        ),
                        child: Text(
                          header!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: primaryColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                          vertical: getProportionateScreenHeight(8),
                        ),
                        child: Text(
                          text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kGreys),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: getProportionateScreenHeight(32)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
