import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'core/core.dart';
import 'theme/custom_theme.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: const StartPage(),
    );
  }
}
