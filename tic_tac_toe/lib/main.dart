import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/settings/blocs/blocs.dart';
import 'core/core.dart';

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
  late ThemeBloc _themeBloc;

  Future<void> _loadSharedPreferences() async {
    MyApp.mainSharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences().whenComplete(() => _themeBloc.loadCurrentTheme());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        builder: (context, state) {
          _themeBloc = BlocProvider.of<ThemeBloc>(context);
          return MaterialApp(
            title: Strings.appName,
            theme: state.theme,
            home: (state is ThemeStateLoading)
                ? Center(
                    child: CircularProgressIndicator(
                      color: state.theme.primaryColor,
                    ),
                  )
                : const StartPage(),
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
