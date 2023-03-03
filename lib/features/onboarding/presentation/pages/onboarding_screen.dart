import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../auth/presentation/pages/sign_in_screen.dart';
import '../widgets/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildOnboardingAppbar(context),
      body: const Body(),
    );
  }

  AppBar buildOnboardingAppbar(BuildContext context) {
    return AppBar(
      leading: Container(),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(16)),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: Text(
              "Skip",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: kCallToAction,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
