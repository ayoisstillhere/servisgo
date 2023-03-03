import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servisgo/features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../widgets/form_error.dart';
import 'phone_number_screen.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;
  final List<String> errors = [];

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PhoneNumberScreen()));
          }
          if (state is SigninFailure) {
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
                  RichText(
                    text: TextSpan(
                      text: "Create a Servis",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
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
                    key: _signupFormKey,
                    child: Column(
                      children: <Widget>[
                        _buildNameTextFormField(context),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        _buildEmailTextFormField(context),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        _buildPasswordTextformField(context),
                        SizedBox(height: getProportionateScreenHeight(40)),
                        FormError(errors: errors),
                        DefaultButton(
                          text: "Sign Up",
                          press: _submitRegisteration,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
        },
      ),
    );
  }

  TextFormField _buildPasswordTextformField(BuildContext context) {
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
      obscureText: true,
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

  TextFormField _buildNameTextFormField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      controller: _nameController,
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

  void _submitRegisteration() async {
    if (_signupFormKey.currentState!.validate()) {
      _signupFormKey.currentState!.save();
      await BlocProvider.of<SigninCubit>(context).submitRegisteration(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        name: _nameController.text.trim(),
        phoneNumber: "",
        address: "",
        pfpURL: "",
      );
    }
  }
}
