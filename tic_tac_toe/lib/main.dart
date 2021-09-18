import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'core/core.dart';
import 'theme/custom_theme.dart';

void main() {
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static SharedPreferences? mainSharedPreferences;

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _loadApp() async {
     MyApp.mainSharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() { 
    super.initState();
    _loadApp();
  }

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      title: Strings.appName,
      theme: CustomTheme.darkThemeGold,
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
