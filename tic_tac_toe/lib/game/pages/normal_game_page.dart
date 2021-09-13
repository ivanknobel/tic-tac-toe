import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class NormalGamePage extends StatefulWidget {
  NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  final _bloc = GameBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe"),
        ),
        body: BlocProvider(
          create: (context) => GameBloc(),
          child: BlocConsumer<GameBloc, GameState>(
            builder: (context, GameState state) {
              return Column(
                children: [
                  Text(
                    _getMessage(state),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const  Padding(
                    padding: EdgeInsets.all(16),
                    child: GameBoard(),
                  ),
                ],
              );
            },
            listener: (context, GameState state) {},
          ),
        ));
  }

  String _getMessage(GameState state) {
    if (state is GameStateStart) {
      String player = _getPlayerName(state.whoPlays);
      return "O Jogador $player começa";
    } else if (state is GameStateOngoing) {
      String player = _getPlayerName(state.whoPlays);
      return "Vez do jogador $player";
    } else if (state is GameStateFinished) {
      GameStatus result = state.result;
      if (result == GameStatus.drawn) {
        return "Empate!";
      } else {
        return _getWinningMessage(state.result);
      }
    } else {
      return "Erro";
    }
  }

  String _getPlayerName(Player player) {
    if (player == Player.x) {
      return "X";
    }
    return "O";
  }

  String _getWinningMessage(GameStatus status) {
    String player = "";
    if (status == GameStatus.oWon) {
      player = _getPlayerName(Player.o);
    } else if (status == GameStatus.xWon) {
      player = _getPlayerName(Player.x);
    }
    return "O jogador $player ganhou!";
  }
}
