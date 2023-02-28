import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: kPrimaryColor),
      ),
    );
  }
}
