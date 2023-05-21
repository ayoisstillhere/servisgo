import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(5),
                right: getProportionateScreenWidth(10)),
            child: const Icon(
              Icons.circle,
              size: 8,
              color: kGreys,
            ),
          ),
          Expanded(
            child: Text(text,
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kGreys)),
          ),
        ],
      ),
    );
  }
}
