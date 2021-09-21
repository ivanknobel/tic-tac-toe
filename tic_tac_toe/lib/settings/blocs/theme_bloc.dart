import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/core.dart';
import 'package:tic_tac_toe/settings/settings.dart';
import 'package:tic_tac_toe/theme/theme.dart';

part 'theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeStateStart(CustomTheme.darkThemeGold)) {
    _loadCurrentTheme();
  }

  final _useCase = locator.get<ThemeStorageUseCase>();

  void _loadCurrentTheme() {
    ThemeData theme = _useCase.getSelectedTheme();
    ThemeState newState = ThemeStateLoad(theme);
    emit(newState);
  }

  void changeTheme(String newThemeKey) {
    _useCase.saveTheme(newThemeKey);
    ThemeData newTheme = _useCase.themeFromString(newThemeKey);
    ThemeState newState = ThemeStateChanged(newTheme);
    emit(newState);
  }
}
