import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleSettings),
      ),
      body: Column(
        children: [
          Text("Teste", style: theme.textTheme.bodyText1,)
        ],
      ),
    );
  }
}
