import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get darkThemeGold {
    return ThemeData(
      primaryColor: CustomColors.gold,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        headline1: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  static ThemeData get darkThemePink {
    return ThemeData(
      primaryColor: CustomColors.pink,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        headline1: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
