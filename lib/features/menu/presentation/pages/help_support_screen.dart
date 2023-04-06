import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servisgo/components/default_button.dart';
import 'package:servisgo/components/nav_page.dart';
import 'package:servisgo/features/auth/presentation/widgets/form_error.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final _contactFormKey = GlobalKey<FormState>();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  bool hidePassword = true;
  final List<String> errors = [];

  @override
  void initState() {
    _subjectController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
        child: SingleChildScrollView(
          child: Form(
            key: _contactFormKey,
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(30)),
                Center(child: SvgPicture.asset("assets/images/supportSvg.svg")),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "How can we help you?",
                  style:
                      MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Theme.of(context).textTheme.displaySmall
                          : Theme.of(context).textTheme.displaySmall!.copyWith(
                                color: kBlacks,
                              ),
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                Text(
                  "It looks like you have problems with our application. We are here to help you, so please get in touch with us.",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kGreys,
                      ),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                _buildSubjectTextFormField(context),
                SizedBox(height: getProportionateScreenHeight(16)),
                _buildEmailTextFormField(context),
                SizedBox(height: getProportionateScreenHeight(16)),
                _buildMessageTextFormField(context),
                SizedBox(height: getProportionateScreenHeight(24)),
                FormError(errors: errors),
                DefaultButton(
                  text: "Send",
                  press: () {
                    if (_contactFormKey.currentState!.validate()) {
                      _contactFormKey.currentState!.save();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavPage()));
                    }
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildEmailTextFormField(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      controller: _emailController,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryColor,
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

  TextFormField _buildSubjectTextFormField(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kSubjectNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kSubjectNullError);
          return "";
        }
        return null;
      },
      controller: _subjectController,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
      decoration: InputDecoration(
        hintText: "Subject",
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: kGreys,
        ),
      ),
    );
  }

  TextFormField _buildMessageTextFormField(BuildContext context) {
    final primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return TextFormField(
      maxLines: 4,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kMessageNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kMessageNullError);
          return "";
        }
        return null;
      },
      controller: _messageController,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
      decoration: InputDecoration(
        hintText: "Type your message...",
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
