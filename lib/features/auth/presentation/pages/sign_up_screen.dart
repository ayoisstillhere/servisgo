import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import 'phone_number_screen.dart';
import 'sign_in_screen.dart';
import '../../../../size_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(106)),
            RichText(
              text: TextSpan(
                text: "Create a Servis",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: kPrimaryColor,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Go\n",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: kCallToAction),
                  ),
                  TextSpan(
                    text: "account",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(52)),
            Form(
              child: Column(
                children: <Widget>[
                  _buildNameTextFormField(context),
                  SizedBox(height: getProportionateScreenHeight(24)),
                  _buildEmailTextFormField(context),
                  SizedBox(height: getProportionateScreenHeight(24)),
                  _buildPasswordTextformField(context),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  DefaultButton(
                    text: "Sign Up",
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneNumberScreen()));
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Center(child: SvgPicture.asset("assets/images/or.svg")),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Container(
                    height: getProportionateScreenHeight(56),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20)),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/google_icon.svg",
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(88)),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account? ",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: kGreys,
                                    ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: kCallToAction,
                                    ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildPasswordTextformField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(16),
              horizontal: getProportionateScreenWidth(16)),
          child: SvgPicture.asset(
            "assets/icons/eye-suffix.svg",
          ),
        ),
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: kGreys,
        ),
      ),
      obscureText: true,
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

  TextFormField _buildNameTextFormField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
      decoration: InputDecoration(
        hintText: "Full Name",
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
