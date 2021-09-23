import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeData _currentTheme;
  late ThemeBloc _themeBloc;

  @override
  Widget build(BuildContext context) {
    _currentTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleSettings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(child: _themeSelectorRow(context)),
          ],
        ),
      ),
    );
  }

  Widget _themeSelectorRow(BuildContext context) {
    return Row(
      children: [
        Text(
          "Tema",
          style: _currentTheme.textTheme.bodyText1,
        ),
        Expanded(
          child: Container(),
        ),
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          _themeBloc = BlocProvider.of<ThemeBloc>(context);
          return ListView.builder(
            itemCount: state.possibleThemes.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              MapEntry<String, ThemeData> option =
                  state.possibleThemes.entries.elementAt(index);
              return _themeCircle(option.value, () {
                _themeBloc.changeTheme(option.key);
              });
            },
          );
        }),
      ],
    );
  }

  Widget _themeCircle(ThemeData theme, VoidCallback onPressed) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: theme.backgroundColor,
      child: Icon(
        Icons.circle,
        color: theme.primaryColor,
        size: 16,
      ),
      constraints: const BoxConstraints.tightFor(height: 32, width: 32),
      shape: CircleBorder(
        side: BorderSide(
          color: _currentTheme.textTheme.bodyText1?.color ??
              _currentTheme.primaryColor,
        ),
      ),
    );
  }
}
