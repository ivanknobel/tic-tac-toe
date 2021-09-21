import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class ThemeStorageUseCase {
  final _sharedPreferences = MyApp.mainSharedPreferences;

  ThemeData getSelectedTheme() {
    String themeKey = "";
    if (_sharedPreferences != null) {
      themeKey = _sharedPreferences!.getString(Strings.keySelectedTheme) ?? "";
    }
    return themeFromString(themeKey);
  }

  void saveTheme(String themeKey) { 
    if (_sharedPreferences != null) {
      _sharedPreferences!.setString(Strings.keySelectedTheme, themeKey);
    }
  }

  ThemeData themeFromString(String themeKey) {
    switch (themeKey) {
      case Strings.keyThemeDarkGold:
        return CustomTheme.darkThemeGold;
      case Strings.keyThemeDarkPink:
        return CustomTheme.darkThemePink;
      default:
        return CustomTheme.darkThemeGold;
    }
  }
}
