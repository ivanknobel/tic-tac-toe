import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';
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
              return Container();
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

  Widget _topMessage(GameState state) {
    if (state is GameStateFinished) {
      if (state.result == GameStatus.drawn) {
        return Text(
          Strings.gameMessageDraw,
          style: textTheme.bodyText1,
        );
      }
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: (state is GameStateStart || state is GameStateFinished)
                ? Strings.gameMessageStart1
                : (state is GameStateOngoing)
                    ? Strings.gameMessageOngiong1
                    : (state is GameStateFinished)
                        ? Strings.gameMessageStart1
                        : null,
            style: textTheme.bodyText1,
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _getPlayerIcon((state is GameStateStart)
                  ? state.whoPlays
                  : (state is GameStateOngoing)
                      ? state.whoPlays
                      : (state is GameStateFinished)
                          ? getWinnerFromResult(state.result)
                          : null),
            ),
          ),
          TextSpan(
              text: (state is GameStateStart)
                  ? Strings.gameMessageStart2
                  : (state is GameStateFinished)
                      ? Strings.gameMessageFinished2
                      : null,
              style: textTheme.bodyText1),
        ],
      ),
    );
  }

  Widget _playerScore(Player player, double score) {
    return Column(
      children: [
        _getPlayerIcon(player, size: 24),
        Text(
          (score.truncateToDouble() == score)
              ? score.toStringAsFixed(0)
              : score.toString(),
          style: textTheme.bodyText1,
        )
      ],
    );
  }

  Icon _getPlayerIcon(Player? player, {double size = 18}) {
    return Icon(
      (player == Player.x)
          ? Icons.close
          : (player == Player.o)
              ? Icons.circle_outlined
              : null,
      size: size,
    );
  }
}
