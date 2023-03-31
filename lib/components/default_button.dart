import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    final textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kBlacks
            : kBgColor;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(16),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
