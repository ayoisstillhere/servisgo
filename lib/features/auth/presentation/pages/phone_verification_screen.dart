import 'package:flutter/material.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/otp_text_form_field.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(106)),
              _buildFormHeader(context),
              SizedBox(height: getProportionateScreenHeight(34)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: OtpTextFormField()),
                  SizedBox(width: getProportionateScreenWidth(17)),
                  const Expanded(child: OtpTextFormField()),
                  SizedBox(width: getProportionateScreenWidth(17)),
                  const Expanded(child: OtpTextFormField()),
                  SizedBox(width: getProportionateScreenWidth(17)),
                  const Expanded(child: OtpTextFormField()),
                  SizedBox(width: getProportionateScreenWidth(17)),
                  const Expanded(child: OtpTextFormField()),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              Center(
                child: Text(
                  "Resend Code",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kCallToAction,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(72)),
              DefaultButton(
                text: "Confirm",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildFormHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verify It's You",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: kPrimaryColor,
              ),
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        RichText(
          text: TextSpan(
            text: "We’ve sent a code to ( ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: kGreys,
                ),
            children: <TextSpan>[
              TextSpan(
                text: "+234 8092338842",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kPrimaryColor,
                    ),
              ),
              TextSpan(
                text: ").\nEnter it here to verify your Identity.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kGreys,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
