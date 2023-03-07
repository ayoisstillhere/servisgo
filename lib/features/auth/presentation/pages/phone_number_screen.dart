import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisgo/features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';
import 'package:servisgo/features/auth/presentation/widgets/form_error.dart';
import 'package:servisgo/features/home/presentation/pages/home_screen.dart';

import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../widgets/form_header.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _phoneFormKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  final List<String> errors = [];

  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
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
                key: _phoneFormKey,
                child: Column(
                  children: <Widget>[
                    _buildPhoneTextFornField(context),
                    SizedBox(height: getProportionateScreenHeight(132)),
                    FormError(errors: errors),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        _submitPhoneNumber(context);
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

  void _submitPhoneNumber(BuildContext context) {
    if (_phoneFormKey.currentState!.validate()) {
      _phoneFormKey.currentState!.save();
      BlocProvider.of<SigninCubit>(context)
          .submitPhoneNumber(phoneNumber: _phoneController.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  TextFormField _buildPhoneTextFornField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        } else if (phoneValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidPhoneError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        } else if (!phoneValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      controller: _phoneController,
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
    );
  }
}
