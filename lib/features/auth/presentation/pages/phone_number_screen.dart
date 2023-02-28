import 'package:flutter/material.dart';
import '../widgets/form_header.dart';

import '../../../../size_config.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(106)),
          const FormHeader(
            title: "Phone Number",
            subtitle:
                "Please Enter your phone number so we can send you a code and verify",
          ),
        ],
      ),
    );
  }
}
