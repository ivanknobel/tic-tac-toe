import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/pages/game_board.dart';

import '../game.dart';

class NormalGamePage extends StatefulWidget {
  NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => GameBloc(),
          child: GameBoard(),
        ),
      ),
    );
  }
}
