import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class ThemeStorageUseCase {
  
  final Map<String, ThemeData> possibleThemes = {
    Strings.keyThemeDarkGold: CustomTheme.darkThemeGold,
    Strings.keyThemeDarkPink: CustomTheme.darkThemePink,
  };

  ThemeData? getSelectedTheme() {
    if (MyApp.mainSharedPreferences == null) {
      return null;
    }
    String themeKey = MyApp.mainSharedPreferences!.getString(Strings.keySelectedTheme) ?? "";
    return themeFromString(themeKey);
  }

  void saveTheme(String themeKey) {
    if (MyApp.mainSharedPreferences != null) {
      MyApp.mainSharedPreferences!.setString(Strings.keySelectedTheme, themeKey);
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
