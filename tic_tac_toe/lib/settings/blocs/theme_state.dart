part of 'theme_bloc.dart';

abstract class ThemeState {
  ThemeData theme;

  ThemeState(this.theme);
}

class ThemeStateStart extends ThemeState {
  ThemeStateStart(ThemeData theme) : super(theme);
}

class ThemeStateLoad extends ThemeState {
  ThemeStateLoad(ThemeData theme) : super(theme);
}

class ThemeStateChanged extends ThemeState {
  ThemeStateChanged(ThemeData newTheme) : super(newTheme);
}
