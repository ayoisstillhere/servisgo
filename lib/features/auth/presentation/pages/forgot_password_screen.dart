import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../bloc/signin_cubit/signin_cubit.dart';
import '../widgets/form_error.dart';
import '../widgets/form_header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _forgotFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  final List<String> errors = [];

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(32),
        ),
        child: SingleChildScrollView(
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
              Form(
                key: _forgotFormKey,
                child: Column(
                  children: [
                    _buildEmailTextFormField(context),
                    SizedBox(height: getProportionateScreenHeight(72)),
                    FormError(errors: errors),
                    DefaultButton(
                      text: "Send Email",
                      press: () async {
                        if (_forgotFormKey.currentState!.validate()) {
                          _forgotFormKey.currentState!.save();
                          await BlocProvider.of<SigninCubit>(context)
                              .resetPassword(
                            email: _emailController.text.trim(),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
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
}
