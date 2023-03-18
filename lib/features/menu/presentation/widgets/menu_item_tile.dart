
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    Key? key,
    required this.press,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final void Function() press;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  SizedBox(width: getProportionateScreenWidth(8)),
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: kGreys,
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(8)),
          const Divider(),
        ],
      ),
    );
  }
}
