import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/start_page.dart';

import 'configs/theme/custom_theme.dart';

void main() {
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
