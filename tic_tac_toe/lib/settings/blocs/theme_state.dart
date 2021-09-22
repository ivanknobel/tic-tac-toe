part of 'theme_bloc.dart';

abstract class ThemeState {
  ThemeData theme;
  Map<String, ThemeData> possibleThemes;

  ThemeState(this.theme, this.possibleThemes);
}

class ThemeStateLoading extends ThemeState {
  ThemeStateLoading(ThemeData theme, Map<String, ThemeData> possibleThemes) : super(theme, possibleThemes);
}

class ThemeStateNormal extends ThemeState {
  ThemeStateNormal(ThemeData theme, Map<String, ThemeData> possibleThemes) : super(theme, possibleThemes);
}

class ThemeStateChanged extends ThemeState {
  ThemeStateChanged(ThemeData newTheme, Map<String, ThemeData> possibleThemes) : super(newTheme, possibleThemes);
}
