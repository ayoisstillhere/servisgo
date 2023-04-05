
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(40),
          decoration: BoxDecoration(
            color: const Color(0xFFBCC7FF).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            child: SvgPicture.asset(
              icon,
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(8)),
        Flexible(
          child: Text(
            text,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kGreys, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
