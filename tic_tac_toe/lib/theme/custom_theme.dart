import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomColors.gold,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: CustomColors.gold,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle()
      ),
    );
  }
}
