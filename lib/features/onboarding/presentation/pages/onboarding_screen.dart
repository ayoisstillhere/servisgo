import 'package:flutter/material.dart';
import '../../../../constants.dart';

import '../../../../size_config.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(16)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kCallToAction,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
