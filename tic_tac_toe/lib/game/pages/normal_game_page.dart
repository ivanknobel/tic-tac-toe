import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

import '../game.dart';

class NormalGamePage extends StatefulWidget {
  const NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  late MatchBloc _matchBloc;
  late GameBloc _gameBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: BlocProvider(
        create: (context) => MatchBloc(),
        child: BlocConsumer<MatchBloc, MatchState>(
          builder: (context, MatchState matchState) {
            _matchBloc = BlocProvider.of<MatchBloc>(context);

            return BlocProvider(
              create: (context) => GameBloc(matchState.currentGame),
              child: BlocConsumer<GameBloc, GameState>(
                builder: (context, GameState gameState) {
                  _gameBloc = BlocProvider.of<GameBloc>(context);

                  return Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      _topMessage(gameState),
                      const SizedBox(
                        height: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: GameBoard(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _playerScore(Player.x, _matchBloc.state.xPoints),
                            Expanded(
                              child: Container(),
                            ),
                            _playerScore(Player.o, _matchBloc.state.oPoints),
                          ],
                        ),
                      ),
                      if (gameState is GameStateFinished) ...[
                        const SizedBox(
                          height: 16,
                        ),
                        MainButton(
                          text: "Novo jogo",
                          action: () {
                            _matchBloc.newGame();
                          },
                        )
                      ],
                    ],
                  );
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
        return const Text(
          "Empate!",
          style: TextStyle(color: Colors.white, fontSize: 18),
        );
      }
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: (state is GameStateStart || state is GameStateFinished)
                ? "Jogador "
                : (state is GameStateOngoing)
                    ? "Vez do jogador "
                    : null,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
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
                ? " começa"
                : (state is GameStateFinished)
                    ? " ganhou!"
                    : null,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerScore(Player player, double score) {
    return Column(
      children: [
        _getPlayerIcon(player, size: 24),
        Text(
          (score.truncateToDouble() == score) ? score.toStringAsFixed(0) : score.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
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
