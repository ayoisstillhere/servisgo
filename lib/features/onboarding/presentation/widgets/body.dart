import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

import '../../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(64)),
          Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset("assets/images/Onboarding1.svg"),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(288)),
                child: Container(
                  decoration: BoxDecoration(
                    color: kBgColor,
                    boxShadow: [
                      BoxShadow(
                        color: kBgColor.withOpacity(0.91),
                        blurRadius: 25,
                        offset: const Offset(0, -50),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(16),
                                vertical: getProportionateScreenHeight(8),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: "Welcome to Servis",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: kPrimaryColor,
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Go",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            color: kCallToAction,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(8),
                                vertical: getProportionateScreenHeight(8),
                              ),
                              child: Text(
                                "We're excited to help you take care of all of your home needs, from cleaning and maintenance to repairs and renovations",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: kPrimaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(32)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: kBgColor,
            ),
            child: Column(
              children: [
                _buildSliderIndicator(),
                SizedBox(height: getProportionateScreenHeight(32)),
                DefaultButton(
                  text: 'Get Started',
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildSliderIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: getProportionateScreenHeight(8),
          width: getProportionateScreenWidth(32),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(24),
              )),
        ),
        SizedBox(width: getProportionateScreenWidth(4)),
        Container(
          height: getProportionateScreenHeight(8),
          width: getProportionateScreenWidth(8),
          decoration: const BoxDecoration(
            color: kGreys,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(4)),
        Container(
          height: getProportionateScreenHeight(8),
          width: getProportionateScreenWidth(8),
          decoration: const BoxDecoration(
            color: kGreys,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
