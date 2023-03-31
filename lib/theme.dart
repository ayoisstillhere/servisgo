import 'package:flutter/material.dart';

import 'constants.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: kBgColor,
    colorScheme: const ColorScheme.light(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );

  static final darktheme = ThemeData(
    scaffoldBackgroundColor: kDarkBgColor,
    appBarTheme: darkAppBarTheme(),
    colorScheme: const ColorScheme.dark(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme(),
    inputDecorationTheme: darkInputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder focusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kBlacks),
  );
  OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.red),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    enabledBorder: defaultInputBorder,
    focusedBorder: focusInputBorder,
    errorBorder: errorInputBorder,
    border: defaultInputBorder,
    fillColor: kLightGreys,
    filled: true,
    suffixIconColor: kGreys,
  );
}

InputDecorationTheme darkInputDecorationTheme() {
  OutlineInputBorder focusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kBlacks),
  );
  OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.red),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    enabledBorder: defaultInputBorder,
    focusedBorder: focusInputBorder,
    errorBorder: errorInputBorder,
    border: defaultInputBorder,
    fillColor: kTextFieldDark,
    filled: true,
    suffixIconColor: kGreys,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.4,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.4,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    color: kBgColor,
    iconTheme: IconThemeData(
      color: kBlacks,
    ),
  );
}

AppBarTheme darkAppBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    color: kDarkBgColor,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
