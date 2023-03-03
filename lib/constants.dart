import 'package:flutter/material.dart';

const kBgColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFF273A69);
const kCallToAction = Color(0xFFBCC7FF);
const kBlacks = Color(0xFF000000);
const kGreys = Color(0xFF6B7280);
const kLightGreys = Color(0xFFF9FAFB);
const kLight30 = Color(0xFF5F8DF7);
const kOutlineVariant = Color(0xFFC4C7C5);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password should be 8 or more characters";
const String kNameNullError = "Please Enter your name";
