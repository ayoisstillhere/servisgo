
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: kPrimaryColor,
              ),
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: kGreys,
              ),
        ),
      ],
    );
  }
}
