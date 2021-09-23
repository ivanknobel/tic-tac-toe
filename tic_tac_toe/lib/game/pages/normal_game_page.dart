import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';

import 'game_tab.dart';

class NormalGamePage extends StatefulWidget {
  const NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  late MatchBloc _matchBloc;
  late GameBloc _gameBloc;
  late TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: BlocProvider(
        create: (context) => MatchBloc(),
        child: BlocConsumer<MatchBloc, MatchState>(
          builder: (context, MatchState matchState) {
            _matchBloc = BlocProvider.of<MatchBloc>(context);
            if (matchState is MatchStateSettings) {
              return const GameSettingsTab();
            }
            return BlocProvider(
              create: (context) => GameBloc(matchState.currentGame),
              child: BlocConsumer<GameBloc, GameState>(
                builder: (context, GameState gameState) {
                  _gameBloc = BlocProvider.of<GameBloc>(context);
                  return GameTab(gameState);
                },
                listener: (context, GameState gameState) {
                  if (gameState is GameStateFinished) {
                    _matchBloc.gameFinished(
                      (gameState.result == GameStatus.xWon)
                          ? Player.x
                          : (gameState.result == GameStatus.oWon)
                              ? Player.o
                              : null,
                    );
                  }
                },
              ),
            );
          },
          listener: (context, MatchState state) {
            if (state is MatchStateNewGame) {
              _gameBloc.newGame(state.currentGame);
            }
          },
        ),
      ),
    );
  }
}
