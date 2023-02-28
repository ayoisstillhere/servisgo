import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../widgets/form_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(106)),
            const FormHeader(
              title: 'Sign In',
              subtitle: 'Welcome back, Sign into your account',
            ),
          ],
        ),
      ),
    );
  }
}
