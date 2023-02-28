import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/form_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(106)),
            SvgPicture.asset("assets/images/Forgot_img.svg"),
            SizedBox(height: getProportionateScreenHeight(24)),
            const FormHeader(
              title: "Forgot Password?",
              subtitle:
                  "Enter your email address below to receive password recovery instructions",
            ),
            SizedBox(height: getProportionateScreenHeight(42)),
            _buildEmailTextFormField(context),
            SizedBox(height: getProportionateScreenHeight(72)),
            DefaultButton(
              text: "Send Email",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildEmailTextFormField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: kGreys,
        ),
      ),
    );
  }
}
