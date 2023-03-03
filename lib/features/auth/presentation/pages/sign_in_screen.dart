import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servisgo/features/home/presentation/pages/home_screen.dart';
import '../bloc/signin_cubit/signin_cubit.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/form_error.dart';
import '../widgets/form_header.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signinFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;
  final List<String> errors = [];

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          }
          if (state is SigninFailure) {
            errors.clear();
            addError(error: "Invalid Login");
          }
        },
        builder: (context, state) {
          if (state is SigninLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(106)),
                  const FormHeader(
                    title: 'Sign In',
                    subtitle: 'Welcome back, Sign into your account',
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Form(
                    key: _signinFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildEmailTextFormField(context),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        _buildPasswordTextFormField(context),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        _buildForgotPassword(context),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        FormError(errors: errors),
                        DefaultButton(
                          text: "Sign In",
                          press: _submitSignin,
                        ),
                        SizedBox(height: getProportionateScreenHeight(42)),
                        Center(child: SvgPicture.asset("assets/images/or.svg")),
                        SizedBox(height: getProportionateScreenHeight(42)),
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
                        SizedBox(height: getProportionateScreenHeight(123)),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: kGreys,
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sign Up',
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
                        SizedBox(
                          height: getProportionateScreenHeight(56),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector _buildForgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen()));
      },
      child: Text(
        "Forgot Password?",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: kCallToAction, fontWeight: FontWeight.w600),
      ),
    );
  }

  TextFormField _buildPasswordTextFormField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      controller: _passwordController,
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
          child: GestureDetector(
            onTap: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            child: SvgPicture.asset(
              "assets/icons/eye-suffix.svg",
            ),
          ),
        ),
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
          color: kGreys,
        ),
      ),
      obscureText: hidePassword,
    );
  }

  TextFormField _buildEmailTextFormField(BuildContext context) {
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

  void _submitSignin() async {
    if (_signinFormKey.currentState!.validate()) {
      _signinFormKey.currentState!.save();
      await BlocProvider.of<SigninCubit>(context).submitSignin(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }
}
