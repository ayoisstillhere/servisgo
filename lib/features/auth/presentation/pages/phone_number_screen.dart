import 'package:flutter/material.dart';
import 'package:servisgo/features/home/presentation/pages/home_screen.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/form_header.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

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
              const FormHeader(
                title: "Phone Number",
                subtitle:
                    "Please Enter your phone number so our Takers can contact you",
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0,
                          color: kGreys,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(132)),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
