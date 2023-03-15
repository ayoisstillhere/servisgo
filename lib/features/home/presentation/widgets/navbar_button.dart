
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    Key? key,
    required this.iconUrl,
    required this.label,
    required this.press,
  }) : super(key: key);
  final String iconUrl;
  final String label;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          SvgPicture.asset(
            iconUrl,
            // ignore: deprecated_member_use
            color: kGreys,
            width: getProportionateScreenWidth(24),
            height: getProportionateScreenHeight(24),
          ),
          SizedBox(height: getProportionateScreenHeight(4)),
          Text(label),
        ],
      ),
    );
  }
}
