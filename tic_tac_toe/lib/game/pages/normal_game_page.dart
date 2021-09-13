import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/widgets/main_button.dart';

import '../game.dart';

class NormalGamePage extends StatefulWidget {
  NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  late GameBloc _bloc;

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
                      text: "Reiniciar",
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
              child: _getPlayerIcon((state is GameStateStart) ? state.whoPlays : (state is GameStateOngoing) ? state.whoPlays : (state is GameStateFinished) ? getWinnerFromResult(state.result) : null),
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

  String _getWinningPlayer(GameStatus status) {
    String player = "";
    if (status == GameStatus.oWon) {
      player = getPlayerName(Player.o);
    } else if (status == GameStatus.xWon) {
      player = getPlayerName(Player.x);
    }
    return "O jogador $player ganhou!";
  }
}
