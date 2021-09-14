import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

import '../game.dart';

class NormalGamePage extends StatefulWidget {
  const NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  late GameBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
        ),
        body: BlocProvider(
          create: (context) => GameBloc(),
          child: BlocConsumer<GameBloc, GameState>(
            builder: (context, GameState state) {
              _bloc = BlocProvider.of<GameBloc>(context);

              return Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  _topMessage(state),
                  const SizedBox(
                    height: 32,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: GameBoard(),
                  ),
                  if (state is GameStateFinished) ...[
                    const SizedBox(
                      height: 32,
                    ),
                    MainButton(
                      text: Strings.buttonRestart,
                      action: () {
                        _bloc.restartGame();
                      },
                    )
                  ]
                ],
              );
            },
            listener: (context, GameState state) {},
          ),
        ));
  }

  Widget _topMessage(GameState state) {
    if (state is GameStateFinished) {
      if (state.result == GameStatus.drawn) {
        return const Text(
          Strings.gameMessageDraw,
          style: TextStyle(color: Colors.white, fontSize: 18),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Icon _getPlayerIcon(Player? player) {
    return Icon(
      (player == Player.x)
          ? Icons.close
          : (player == Player.o)
              ? Icons.circle_outlined
              : null,
      size: 18,
    );
  }
}
