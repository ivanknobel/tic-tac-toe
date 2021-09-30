import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';
import 'package:tic_tac_toe/game/game.dart';

// ignore: must_be_immutable
class GameTab extends StatelessWidget {
  late MatchBloc _matchBloc;
  late TextTheme _textTheme;
  final GameState gameState;

  GameTab(this.gameState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
    _matchBloc = BlocProvider.of<MatchBloc>(context);

    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        _topMessage(gameState),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
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
              _playerScore(Player.x, _matchBloc.state.xPoints, _matchBloc.state.match.colors[Player.x]),
              Expanded(
                child: Container(),
              ),
              _playerScore(Player.o, _matchBloc.state.oPoints, _matchBloc.state.match.colors[Player.o]),
            ],
          ),
        ),
        if (gameState is GameStateFinished) ...[
          const SizedBox(
            height: 16,
          ),
          MainButton(
            text: Strings.buttonNewGame,
            action: () {
              _matchBloc.newGame();
            },
          )
        ],
      ],
    );
  }

  Widget _topMessage(GameState state) {
    if (state is GameStateFinished) {
      if (state.result == GameStatus.drawn) {
        return Text(
          Strings.gameMessageDraw,
          style: _textTheme.bodyText1,
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
            style: _textTheme.bodyText1,
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: PlayerIcon((state is GameStateStart)
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
              style: _textTheme.bodyText1),
        ],
      ),
    );
  }

  Widget _playerScore(Player player, double score, Color? color) {
    return Column(
      children: [
        PlayerIcon(player, size: 24, color: color),
        Text(
          (score.truncateToDouble() == score)
              ? score.toStringAsFixed(0)
              : score.toString(),
          style: _textTheme.bodyText1?.copyWith(color: color),
        )
      ],
    );
  }
}
