import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/Onboarding1.png",
      "header": "Welcome to ServisGo",
      "text":
          "We're excited to help you take care of all of your home needs, from cleaning and maintenance to repairs and renovations",
    },
    {
      "image": "assets/images/Onboarding2.png",
      "header": "Book Services Providers Now!",
      "text":
          "To get started, simply create an account and browse through our available services. When you find something you need, just place an order and we'll match you with a trusted and qualified professional who can help.",
    },
    {
      "image": "assets/images/Onboarding3.png",
      "header": "Chat With Taskers",
      "text":
          "You can track the progress of your order and communicate with your professional directly through the app. And when the job is done, you can leave a review and let us know how we did.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(64)),
          Expanded(
            flex: 5,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]['image'],
                header: onboardingData[index]['header'],
                text: onboardingData[index]['text'],
                index: currentPage,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
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
          ),
        ],
      ),
    );
  }

  Row _buildSliderIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildDot(0),
        SizedBox(width: getProportionateScreenWidth(4)),
        _buildDot(1),
        SizedBox(width: getProportionateScreenWidth(4)),
        _buildDot(2)
      ],
    );
  }

  Container _buildDot(int index) {
    return currentPage == index
        ? Container(
            height: getProportionateScreenHeight(8),
            width: getProportionateScreenWidth(32),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(24),
                )),
          )
        : Container(
            height: getProportionateScreenHeight(8),
            width: getProportionateScreenWidth(8),
            decoration: const BoxDecoration(
              color: kGreys,
              shape: BoxShape.circle,
            ),
          );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.text,
    required this.index,
    required this.image,
    required this.header,
  }) : super(key: key);
  final String? image, header, text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            image!,
            height: getProportionateScreenHeight(407.26),
            width: getProportionateScreenWidth(202.68),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(288)),
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
                        child: Text(
                          header!,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: kPrimaryColor,
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
                          text!,
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
    );
  }
}
